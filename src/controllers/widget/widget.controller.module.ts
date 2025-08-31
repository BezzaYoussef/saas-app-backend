import { Module } from '@nestjs/common';
import { WidgetController } from './widget.controller';
import { WidgetModule } from '../../services/widget/widget.module';

@Module({
  imports: [WidgetModule],
  controllers: [WidgetController],
  exports: [WidgetController],
})
export class WidgetControllerModule {}
