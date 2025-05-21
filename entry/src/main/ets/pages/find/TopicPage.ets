import { ViewStateConstant } from "../../constants/ViewStateConstant";
import { TopicModelItemList } from "../../model/TopicModel";
import { CommonRouteParams } from "../../route/RouteParams";
import { RoutePath } from "../../route/RoutePath";
import { Router } from "../../route/Router";
import ImageRegexUtils from "../../utils/ImageRegexUtils";
import { LogUtils } from "../../utils/LogUtils";
import TopicViewModel from "../../viewmodel/TopicViewModel";
import { RefreshFooter } from "../../views/RefreshFooter";
import { StateComponent } from "../../views/StateComponent";

@Component
export struct TopicPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING;
  @State showLoading: boolean = false;
  @State isRefreshing: boolean = false;
  @State topicList: TopicModelItemList[] = [];
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  hasInit = false

  aboutToAppear() {
    TopicViewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet();
    }
  }

  onHomeTabSelected() {
    LogUtils.debug("Topic-homeTabSelectedIndex>>>",
      `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  onFindTabSelectedIndex() {
    LogUtils.debug("Topic-onFindTabSelectedIndex>>>",
      `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 2) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    TopicViewModel.getTopicData((result) => {
      this.isRefreshing = false;
      this.showLoading = false;
      if (TopicViewModel.pageIndex == 0) {
        this.topicList = result
      } else {
        this.topicList = [...this.topicList, ...result]
      }
    })
  }

  build() {
    Stack() {
      StateComponent({
        viewState: this.viewState, retryCallback: () => {
          this.loadNet()
        }
      }) {
        Refresh({ refreshing: $$this.isRefreshing }) {
          List() {
            ForEach(this.topicList, (item: TopicModelItemList, index: number) => {
              ListItem() {
                Image(ImageRegexUtils(item.data.image))
                  .alt($r('app.media.back_placeholder'))
                  .width("100%")
                  .height($r('app.float.size_200'))
                  .border({ radius: $r('app.float.size_5') })
              }.onClick(() => {
                Router.push(RoutePath.TopicDetailPage, { "id": item.data.id } as CommonRouteParams)
              })
            })
            ListItem() {
              RefreshFooter({ showFooter: this.showLoading })
            }
          }.listDirection(Axis.Vertical)
          .onReachEnd(() => {
            this.showLoading = true
            this.loadNet()
          }).padding({ left: $r('app.float.size_10'), right: $r('app.float.size_10'), top: $r('app.float.size_10') })
        }.onRefreshing(() => {
          TopicViewModel.pageIndex = 0
          this.loadNet()
        })
      }
    }
  }
}