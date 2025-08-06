import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { WidgetRepository } from '../../data/widget/repository/widget.repository';
import { Widget } from '../../data/models/widget/widget.model';

export interface CreateWidgetDto {
  name: string;
  description?: string;
  category: string;
  isActive: boolean;
  html: string;
  css: string;
  js: string;
  createdBy?: string;
}

export interface UpdateWidgetDto {
  name?: string;
  description?: string;
  category?: string;
  isActive?: boolean;
  html?: string;
  css?: string;
  js?: string;
  updatedBy?: string;
}

@Injectable()
export class WidgetService {
  constructor(private readonly widgetRepository: WidgetRepository) {}

  async createWidget(createWidgetDto: CreateWidgetDto): Promise<Widget> {
    // Validate required fields
    if (!createWidgetDto.name || !createWidgetDto.html) {
      throw new BadRequestException('Name and HTML content are required');
    }

    // Validate category
    const validCategories = ['general', 'pricing', 'features', 'contact', 'newsletter'];
    if (!validCategories.includes(createWidgetDto.category)) {
      throw new BadRequestException('Invalid category');
    }

    // Sanitize HTML content
    const sanitizedHtml = this.sanitizeHtml(createWidgetDto.html);
    const sanitizedCss = this.sanitizeCss(createWidgetDto.css || '');
    const sanitizedJs = this.sanitizeJs(createWidgetDto.js || '');

    const widgetData = {
      ...createWidgetDto,
      html: sanitizedHtml,
      css: sanitizedCss,
      js: sanitizedJs
    };

    return await this.widgetRepository.create(widgetData);
  }

  async getAllWidgets(): Promise<Widget[]> {
    return await this.widgetRepository.findAll();
  }

  async getWidgetById(id: string): Promise<Widget> {
    const widget = await this.widgetRepository.findById(id);
    if (!widget) {
      throw new NotFoundException('Widget not found');
    }
    return widget;
  }

  async getWidgetsByCategory(category: string): Promise<Widget[]> {
    const validCategories = ['general', 'pricing', 'features', 'contact', 'newsletter'];
    if (!validCategories.includes(category)) {
      throw new BadRequestException('Invalid category');
    }
    return await this.widgetRepository.findByCategory(category);
  }

  async getActiveWidgets(): Promise<Widget[]> {
    return await this.widgetRepository.findActive();
  }

  async updateWidget(id: string, updateWidgetDto: UpdateWidgetDto): Promise<Widget> {
    const widget = await this.widgetRepository.findById(id);
    if (!widget) {
      throw new NotFoundException('Widget not found');
    }

    // Validate category if provided
    if (updateWidgetDto.category) {
      const validCategories = ['general', 'pricing', 'features', 'contact', 'newsletter'];
      if (!validCategories.includes(updateWidgetDto.category)) {
        throw new BadRequestException('Invalid category');
      }
    }

    // Sanitize content if provided
    if (updateWidgetDto.html) {
      updateWidgetDto.html = this.sanitizeHtml(updateWidgetDto.html);
    }
    if (updateWidgetDto.css) {
      updateWidgetDto.css = this.sanitizeCss(updateWidgetDto.css);
    }
    if (updateWidgetDto.js) {
      updateWidgetDto.js = this.sanitizeJs(updateWidgetDto.js);
    }

    const updatedWidget = await this.widgetRepository.update(id, updateWidgetDto);
    if (!updatedWidget) {
      throw new NotFoundException('Widget not found');
    }
    return updatedWidget;
  }

  async deleteWidget(id: string): Promise<Widget> {
    const widget = await this.widgetRepository.findById(id);
    if (!widget) {
      throw new NotFoundException('Widget not found');
    }
    return await this.widgetRepository.delete(id);
  }

  async toggleWidgetStatus(id: string, isActive: boolean): Promise<Widget> {
    const widget = await this.widgetRepository.findById(id);
    if (!widget) {
      throw new NotFoundException('Widget not found');
    }
    return await this.widgetRepository.toggleStatus(id, isActive);
  }

  async duplicateWidget(id: string): Promise<Widget> {
    const widget = await this.widgetRepository.findById(id);
    if (!widget) {
      throw new NotFoundException('Widget not found');
    }
    return await this.widgetRepository.duplicate(id);
  }

  async getWidgetStats(): Promise<any> {
    return await this.widgetRepository.getStats();
  }

  async searchWidgets(query: string): Promise<Widget[]> {
    if (!query || query.trim().length === 0) {
      throw new BadRequestException('Search query is required');
    }
    return await this.widgetRepository.search(query.trim());
  }

  async getWidgetEmbedCode(id: string): Promise<string> {
    const widget = await this.getWidgetById(id);
    if (!widget.isActive) {
      throw new BadRequestException('Widget is not active');
    }

    return this.generateEmbedCode(widget);
  }

  private sanitizeHtml(html: string): string {
    // Remove potentially dangerous script tags
    return html.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '');
  }

  private sanitizeCss(css: string): string {
    // Basic CSS sanitization - ensure it's properly scoped
    return css.replace(/^/gm, '#widget-container ');
  }

  private sanitizeJs(js: string): string {
    // Add error handling to JavaScript
    return `
      try {
        ${js}
      } catch (error) {
        console.error('Widget JavaScript error:', error);
      }
    `;
  }

  private generateEmbedCode(widget: Widget): string {
    const sanitizedHtml = this.sanitizeHtml(widget.html);
    const sanitizedCss = this.sanitizeCss(widget.css || '');
    const sanitizedJs = this.sanitizeJs(widget.js || '');

    return `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${widget.name}</title>
    <style>
        ${sanitizedCss}
    </style>
</head>
<body>
    <div id="widget-container">
        ${sanitizedHtml}
    </div>
    <script>
        ${sanitizedJs}
    </script>
</body>
</html>
    `;
  }
} 