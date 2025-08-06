import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type WidgetDocument = Widget & Document;

@Schema({ timestamps: true })
export class Widget {
  @Prop({ required: true, maxlength: 100 })
  name: string;

  @Prop({ maxlength: 500 })
  description?: string;

  @Prop({ required: true, enum: ['general', 'pricing', 'features', 'contact', 'newsletter'] })
  category: string;

  @Prop({ default: true })
  isActive: boolean;

  @Prop({ required: true, type: String })
  html: string;

  @Prop({ type: String, default: '' })
  css: string;

  @Prop({ type: String, default: '' })
  js: string;

  @Prop({ type: String })
  createdBy?: string;

  @Prop({ type: String })
  updatedBy?: string;

  @Prop({ type: Date, default: Date.now })
  createdAt: Date;

  @Prop({ type: Date, default: Date.now })
  updatedAt: Date;
}

export const WidgetSchema = SchemaFactory.createForClass(Widget);

// Add indexes for better performance
WidgetSchema.index({ name: 1 });
WidgetSchema.index({ category: 1 });
WidgetSchema.index({ isActive: 1 });
WidgetSchema.index({ createdAt: -1 }); 