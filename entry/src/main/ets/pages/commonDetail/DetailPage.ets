import { router } from '@kit.ArkUI';
import { CategoryRouteParams } from '../../route/RouteParams';
import { LogUtils } from '../../utils/LogUtils';
import { CommonTopBar } from '../../views/CommonTopBar';
import { VideoComponent } from '../../views/VideoComponent';
import { VideoBottomComponent } from './VideoBottomComponent';

@Entry
@Component
struct DetailPage {
  @State isAutoPlay: boolean = true;
  @State showControls: boolean = true;
  @State playUrl: string = "";
  @State relationId: number = -1
  private videoController: VideoController = new VideoController();

  aboutToAppear(): void {
    let routerParams = router.getParams() as CategoryRouteParams
    this.relationId = routerParams.id
    this.playUrl = routerParams.playUrl

    LogUtils.debug(this.relationId + "-----", this.playUrl)
  }

  build() {
    Column() {
      CommonTopBar({ title: "视频详情", alpha: 1 })
      this.headerPlayer()
      VideoBottomComponent({
        relationId: this.relationId,
        onItemClick: (playUrl) => {
          this.playUrl = playUrl
        }
      }).layoutWeight(1)
    }.width("100%")
    .height("100%")
  }

  @Builder
  headerPlayer() {
    VideoComponent({ showControls: this.showControls, playUrl: this.playUrl, isAutoPlay: this.isAutoPlay })
      .width('100%')
      .height($r('app.float.size_250'))
  }
}