import { ViewStateConstant } from "../../constants/ViewStateConstant"
import { HomeModelIssueListItemList } from "../../model/HomeModel"
import { LogUtils } from "../../utils/LogUtils"
import { CommonTopBar } from "../../views/CommonTopBar"
import HomeViewModel from "../../viewmodel/HomeViewModel"
import { StateComponent } from "../../views/StateComponent"
import { HomeListItemComponent } from "./HomeListItemComponent"
import { RefreshFooter } from "../../views/RefreshFooter"
import { CommonSkeleton } from "../../views/CommonSkeleton"
import { RoutePath } from "../../route/RoutePath"
import { Router } from "../../route/Router"
import { CategoryRouteParams } from "../../route/RouteParams"

@Entry
@Component
export struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State dataList: HomeModelIssueListItemList[] = []
  @State showLoading: boolean = false

  // 不可和Entry公用
  // @Consume @Watch('onTabSelected') homeTabSelected: number

  aboutToAppear() {
    HomeViewModel.observeState(state => {
      this.viewState = state
    })
    this.loadNet()
  }

  // onTabSelected() {
  //   LogUtils.debug("onTabSelected>>>", `${this.homeTabSelected}`)
  // }

  loadNet() {
    HomeViewModel.getHomeList((result) => {

      LogUtils.debug("数据返回成功。。。")
      this.isRefreshing = false
      this.showLoading = false
      if (HomeViewModel.getDate() == "") {
        this.dataList = result
      } else {
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    Column() {
      CommonTopBar({ title: "首页", backButton: false, alpha: 1 }).align(Alignment.TopStart)
      Stack() {
        StateComponent({
          viewState: this.viewState,
          showSkeleton: true,
          retryCallback: () => {
            this.loadNet()
          }
        }) {
          Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
            List({ space: 10, initialIndex: 0 }) {
              ForEach(this.dataList, (item: HomeModelIssueListItemList, index: number) => {
                ListItem() {
                  HomeListItemComponent({ item: item }).onClick(() => {
                    Router.push(RoutePath.DetailPage, {
                      "id": item?.data?.id,
                      "playUrl": item?.data?.playUrl
                    } as CategoryRouteParams)
                  })
                }
              })
              ListItem() {
                RefreshFooter({ showFooter: this.showLoading })
              }
            }.listDirection(Axis.Vertical)
            .divider({
              strokeWidth: 1,
              color: $r('app.color.color_f5f5f5'),
              startMargin: 10,
              endMargin: 10
            }) // 每行之间的分界线
            .onScrollIndex((firstIndex: number, lastIndex: number) => {

            })
            .onReachEnd(() => {
              this.showLoading = true
              this.loadNet()
            })
          }.onRefreshing(() => {
            HomeViewModel.revertDate()
            this.loadNet()
          }).padding({ left: 10, right: 10 })
        }
      }.layoutWeight(1)
    }
  }

  @Builder
  skeletonContent() {
    CommonSkeleton()
  }
}