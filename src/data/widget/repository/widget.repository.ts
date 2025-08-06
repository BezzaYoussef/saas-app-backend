import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Widget, WidgetDocument } from '../../models/widget/widget.model';

@Injectable()
export class WidgetRepository {
  constructor(
    @InjectModel(Widget.name) private widgetModel: Model<WidgetDocument>
  ) {}

  async create(widgetData: Partial<Widget>): Promise<Widget> {
    const widget = new this.widgetModel(widgetData);
    return await widget.save();
  }

  async findAll(): Promise<Widget[]> {
    return await this.widgetModel.find().sort({ createdAt: -1 }).exec();
  }

  async findById(id: string): Promise<Widget | null> {
    return await this.widgetModel.findById(id).exec();
  }

  async findByCategory(category: string): Promise<Widget[]> {
    return await this.widgetModel.find({ category }).sort({ createdAt: -1 }).exec();
  }

  async findActive(): Promise<Widget[]> {
    return await this.widgetModel.find({ isActive: true }).sort({ createdAt: -1 }).exec();
  }

  async update(id: string, widgetData: Partial<Widget>): Promise<Widget | null> {
    widgetData.updatedAt = new Date();
    return await this.widgetModel.findByIdAndUpdate(id, widgetData, { new: true }).exec();
  }

  async delete(id: string): Promise<Widget | null> {
    return await this.widgetModel.findByIdAndDelete(id).exec();
  }

  async toggleStatus(id: string, isActive: boolean): Promise<Widget | null> {
    return await this.widgetModel.findByIdAndUpdate(
      id, 
      { isActive, updatedAt: new Date() }, 
      { new: true }
    ).exec();
  }

  async duplicate(id: string): Promise<Widget | null> {
    const original = await this.findById(id);
    if (!original) return null;

    const duplicated = new this.widgetModel({
      ...(original as any).toObject ? (original as any).toObject() : original,
      _id: undefined,
      name: `${original.name} (Copy)`,
      createdAt: new Date(),
      updatedAt: new Date()
    });

    return await duplicated.save();
  }

  async getStats(): Promise<any> {
    const total = await this.widgetModel.countDocuments();
    const active = await this.widgetModel.countDocuments({ isActive: true });
    const byCategory = await this.widgetModel.aggregate([
      {
        $group: {
          _id: '$category',
          count: { $sum: 1 }
        }
      }
    ]);

    return {
      total,
      active,
      inactive: total - active,
      byCategory
    };
  }

  async search(query: string): Promise<Widget[]> {
    return await this.widgetModel.find({
      $or: [
        { name: { $regex: query, $options: 'i' } },
        { description: { $regex: query, $options: 'i' } }
      ]
    }).sort({ createdAt: -1 }).exec();
  }
} 