import router from '@ohos.router'
import { ContainerRouteParams } from '../../route/RouteParams'
import { CommonTopBar } from '../../views/CommonTopBar'
import { CategoryPage } from '../find/CategoryPage'
import { FocusPage } from '../find/FocusPage'
import { TopicPage } from '../find/TopicPage'

@Entry
@Component
struct ContainerPage {
  @State containerType: string = "focus"
  @State title: string = "关注"
  @Provide homeTabSelected: number = 0
  @Provide findCurrentIndex: number = 0

  aboutToAppear(): void {
    const params = router.getParams() as ContainerRouteParams
    this.containerType = params.containerType;
    this.convertTitle()
  }

  build() {
    Column() {
      CommonTopBar({ title: this.title, alpha: 1 })
      Stack() {
        this.buildContent()
      }.layoutWeight(1)
    }
  }

  convertTitle() {
    if (this.containerType == 'focus') {
      this.title = "关注"
    } else if (this.containerType == 'topic') {
      this.title = "热门"
    } else if (this.containerType == 'category') {
      this.title = "分类"
    }
  }

  @Builder
  buildContent() {
    if (this.containerType == 'focus') {
      FocusPage({ hasInit: true })
    } else if (this.containerType == 'topic') {
      TopicPage({ hasInit: true })
    } else if (this.containerType == 'category') {
      CategoryPage({ hasInit: true })
    } else {
      Text("暂未找到页面")
    }
  }
}