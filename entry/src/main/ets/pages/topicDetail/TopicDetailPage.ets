import { ViewStateConstant } from '../../constants/ViewStateConstant'
import { router } from '@kit.ArkUI'
import { CommonRouteParams } from '../../route/RouteParams'
import { StateComponent } from '../../views/StateComponent'
import ImageRegexUtils from '../../utils/ImageRegexUtils'
import { CommonTopBar } from '../../views/CommonTopBar'
import { TopicDetailModel, TopicDetailModelItemList } from '../../model/TopicDetailModel'
import TopicDetailViewModel from '../../viewmodel/TopicDetailViewModel'
import { VideoComponent } from '../../views/VideoComponent'

@Entry
@Component
struct CategoryDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State title: string = ""
  @State detailData: TopicDetailModel = {}
  @State playIndex: number = -1
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  @State playUrl: string = ""

  aboutToAppear() {
    let routeParams = router.getParams() as CommonRouteParams
    TopicDetailViewModel.topicId = routeParams.id
    TopicDetailViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    TopicDetailViewModel.getTopicDetailList((result) => {
      this.detailData = result
      this.title = this.detailData.brief || ""
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: this.title, alpha: 1 })
      Stack() {
        StateComponent({
          viewState: this.viewState, retryCallback: () => {
            this.loadNet()
          }
        }) {
          List({ space: 10 }) {
            ListItem() {
              this.topicHeader()
            }

            ForEach(this.detailData.itemList, (item: TopicDetailModelItemList, index: number) => {
              ListItem() {
                this.topicContent(item, index)
              }
            })
          }
          .height("100%")
          .width("100%")
          .onScrollIndex((firstIndex: number, lastIndex: number) => {
            if (this.playIndex > lastIndex || this.playIndex < firstIndex) {
              this.playIndex = -1
            }
          })
        }
      }.layoutWeight(1)

    }.height("100%")

  }

  @Builder
  topicHeader() {

    Column() {
      Image(ImageRegexUtils(this.detailData.headerImage))
        .width("100%")
        .height($r('app.float.size_280'))
        .alt($r('app.media.back_placeholder'))

      Text(this.detailData.brief)
        .width("80%")
        .height($r('app.float.size_46'))
        .border({ radius: $r('app.float.size_5'), width: $r('app.float.size_1'), color: $r('app.color.color_333') })
        .fontColor($r('app.color.color_333'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .margin({ top: $r('app.float.size_minus_23') })
        .backgroundColor($r('app.color.color_white'))

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))
    }
  }

  @Builder
  topicContent
  (item: TopicDetailModelItemList, index: number) {

    Column() {
      if (this.playIndex == index) {
        VideoComponent({
          showControls: $showControls,
          playUrl: $playUrl,
          isAutoPlay: this.isAutoPlay
        })
          .width('100%')
          .height($r('app.float.size_250'))

      } else {
        Stack() {
          Image(item.data.content.data.cover.feed)
            .width("100%")
            .height($r('app.float.size_250'))
            .alt($r('app.media.back_placeholder'))

          Image($r('app.media.icon_play'))
            .width($r('app.float.size_45'))
            .height($r('app.float.size_45'))
            .alt($r('app.media.back_placeholder'))
            .onClick(() => {
              this.playIndex = index
              this.playUrl = item.data.content.data.playUrl
            })
        }
      }

      Text(this.detailData.brief)
        .width("80%")
        .fontColor($r('app.color.color_333'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .backgroundColor($r('app.color.color_white'))
        .margin({ top: $r('app.float.size_10') })

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))
    }
  }
}