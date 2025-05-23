import { ViewStateConstant } from "../constants/ViewStateConstant";
import { CommonSkeleton } from "./CommonSkeleton";

@Component
export struct StateComponent {
  @Prop viewState: string;
  @BuilderParam viewContent: () => void
  //重试的回调方法
  retryCallback?: () => void
  //是否骨架屏幕
   showSkeleton: boolean = false

  build() {
    Stack() {
      if (this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS) {
        this.holdContent()
      } else {
        this.viewContent()
      }
    }
  }

  @Builder
  holdContent() {
    if (this.showSkeleton && this.viewState == ViewStateConstant.VIEW_STATE_LOADING) {
      CommonSkeleton()
    } else {
      Column() {
        Image(this.convertImage())
          .width($r('app.float.size_100'))
          .height($r('app.float.size_100'))
        Text(this.convertValue())
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_666'))
          .margin($r('app.float.size_10'))
        if (this.viewState != ViewStateConstant.VIEW_STATE_LOADING) {
          Button($r('app.string.press_retry'))
            .width($r('app.float.size_120'))
            .height($r('app.float.size_35'))
            .backgroundColor($r('app.color.color_red'))
            .fontColor($r('app.color.color_fff'))
            .onClick(() => {
              this.retryCallback?.()
            })
        }
      }
    }
  }

  convertValue() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.string.loading')
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.string.load_error')
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.string.net_error')
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.string.load_emtpy')
        break;
      default:
        return $r('app.string.load_success')
        break;
    }
  }

  /**
   * 转换图片
   * @returns
   */
  convertImage() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.media.loading')
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.media.common_empty_content')
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.media.timeout')
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.media.common_empty_content')
        break;
      default:
        return $r('app.media.loading')
        break;
    }
  }
}