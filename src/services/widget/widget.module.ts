import { Module } from '@nestjs/common';
import { WidgetService } from './widget.service';
import { WidgetDataModule } from '../../data/widget/widget.data.module';

@Module({
  imports: [WidgetDataModule],
  providers: [WidgetService],
  exports: [WidgetService]
})
export class WidgetModule {} 