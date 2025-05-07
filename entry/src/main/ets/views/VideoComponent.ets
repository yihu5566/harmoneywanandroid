import { LogUtils } from "../utils/LogUtils";

@Component
export struct VideoComponent {
  @Link playUrl: string;
  @Link showControls: boolean;
  @State showLoading: boolean = true;
  private controller?: VideoController;
  private isAutoPlay: boolean = false

  build() {
    Stack() {
      Video({ src: this.playUrl, controller: this.controller })
        .width("100%")
        .height("100%")
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart(() => {
          LogUtils.info('onStart')
          this.showLoading = false
        })
        .onPause(() => {
          LogUtils.info('onPause')
        })
        .onFinish(() => {
          LogUtils.info('onFinish')
        })
        .onError(() => {
          LogUtils.info('onError')
          this.showLoading = false
        })
        .onPrepared((e) => {
          LogUtils.info('onPrepared is ' + e.duration)
        })
        .onSeeking((e) => {
          LogUtils.info('onSeeking is ' + e.time)
          this.showLoading = true
        })
        .onSeeked((e) => {
          LogUtils.info('onSeeked is ' + e.time)
          this.showLoading = false
        })
        .onUpdate((e) => {
          LogUtils.info('onUpdate is ' + e.time)
        })
      Image($r('app.media.loading'))
        .width($r('app.float.size_50'))
        .height($r('app.float.size_50'))
        .visibility(this.showLoading ? Visibility.Visible : Visibility.None)
    }.width("100%")
    .height("100%")
  }
}