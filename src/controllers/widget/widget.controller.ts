import { 
  Controller, 
  Get, 
  Post, 
  Put, 
  Delete, 
  Patch,
  Body, 
  Param, 
  Query, 
  Res,
  HttpStatus,
  HttpCode 
} from '@nestjs/common';
import { Response } from 'express';
import { WidgetService, CreateWidgetDto, UpdateWidgetDto } from '../../services/widget/widget.service';

@Controller('api/widgets')
export class WidgetController {
  constructor(private readonly widgetService: WidgetService) {}

  @Post()
  @HttpCode(HttpStatus.CREATED)
  async createWidget(@Body() createWidgetDto: CreateWidgetDto) {
    try {
      const widget = await this.widgetService.createWidget(createWidgetDto);
      return {
        success: true,
        data: widget,
        message: 'Widget created successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get()
  async getAllWidgets() {
    try {
      const widgets = await this.widgetService.getAllWidgets();
      return {
        success: true,
        data: widgets,
        message: 'Widgets retrieved successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get('active')
  async getActiveWidgets() {
    try {
      const widgets = await this.widgetService.getActiveWidgets();
      return {
        success: true,
        data: widgets,
        message: 'Active widgets retrieved successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get('category/:category')
  async getWidgetsByCategory(@Param('category') category: string) {
    try {
      const widgets = await this.widgetService.getWidgetsByCategory(category);
      return {
        success: true,
        data: widgets,
        message: `Widgets in category '${category}' retrieved successfully`
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get('search')
  async searchWidgets(@Query('q') query: string) {
    try {
      const widgets = await this.widgetService.searchWidgets(query);
      return {
        success: true,
        data: widgets,
        message: `Search results for '${query}'`
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get('stats')
  async getWidgetStats() {
    try {
      const stats = await this.widgetService.getWidgetStats();
      return {
        success: true,
        data: stats,
        message: 'Widget statistics retrieved successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get(':id')
  async getWidgetById(@Param('id') id: string) {
    try {
      const widget = await this.widgetService.getWidgetById(id);
      return {
        success: true,
        data: widget,
        message: 'Widget retrieved successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Put(':id')
  async updateWidget(@Param('id') id: string, @Body() updateWidgetDto: UpdateWidgetDto) {
    try {
      const widget = await this.widgetService.updateWidget(id, updateWidgetDto);
      return {
        success: true,
        data: widget,
        message: 'Widget updated successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  async deleteWidget(@Param('id') id: string) {
    try {
      await this.widgetService.deleteWidget(id);
      return {
        success: true,
        message: 'Widget deleted successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Patch(':id/status')
  async toggleWidgetStatus(@Param('id') id: string, @Body() body: { isActive: boolean }) {
    try {
      const widget = await this.widgetService.toggleWidgetStatus(id, body.isActive);
      return {
        success: true,
        data: widget,
        message: `Widget ${body.isActive ? 'activated' : 'deactivated'} successfully`
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Post(':id/duplicate')
  async duplicateWidget(@Param('id') id: string) {
    try {
      const widget = await this.widgetService.duplicateWidget(id);
      return {
        success: true,
        data: widget,
        message: 'Widget duplicated successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }

  @Get(':id/embed')
  async getWidgetEmbed(@Param('id') id: string, @Res() res: Response) {
    try {
      const embedCode = await this.widgetService.getWidgetEmbedCode(id);
      res.setHeader('Content-Type', 'text/html');
      res.setHeader('Access-Control-Allow-Origin', '*');
      res.send(embedCode);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        success: false,
        message: error.message
      });
    }
  }

  @Get(':id/embed-code')
  async getWidgetEmbedCode(@Param('id') id: string) {
    try {
      const embedCode = await this.widgetService.getWidgetEmbedCode(id);
      return {
        success: true,
        data: {
          embedCode,
          iframeCode: `<iframe src="/api/widgets/${id}/embed" width="100%" height="600" frameborder="0"></iframe>`
        },
        message: 'Embed code generated successfully'
      };
    } catch (error) {
      return {
        success: false,
        message: error.message
      };
    }
  }
} 