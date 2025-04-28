import { ViewStateConstant } from "../../constants/ViewStateConstant"
import { HomeModelIssueListItemList } from "../../model/HomeModel"
import { LogUtils } from "../../utils/LogUtils"
import { CommonTopBar } from "../../view/CommonTopBar"
import HomeViewModel from "../../viewmodel/HomeViewModel"

@Entry
@Component
export struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State dataList: HomeModelIssueListItemList[] = []
  @State showLoading: boolean = false
  @Consume @Watch('onTabSelected') homeTabSelected: number

  aboutToAppear() {
    HomeViewModel.observeState(state => {
      this.viewState = state
    })
    this.loadNet()
  }

  onTabSelected() {
    LogUtils.debug("onTabSelected>>>", `${this.homeTabSelected}`)
  }

  loadNet() {
    HomeViewModel.getHomeList((result) => {
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
      CommonTopBar()
    }

  }
}