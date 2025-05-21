import { ContainerRouteParams } from "../../route/RouteParams";
import { RoutePath } from "../../route/RoutePath";
import { Router } from "../../route/Router";
import { CommonDialog } from "../../views/CommonDialog"

@Entry
@Component
export struct MinePage {
  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonDialog({ title: $dialogTitle, description: $dialogContent, showPositive: false })
  })

  aboutToAppear() {

  }

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Image($r("app.media.default_avatar"))
            .width($r('app.float.size_70'))
            .height($r('app.float.size_70'))
            .border({ radius: $r('app.float.size_35') })
          Text("Harmony-开眼App")
            .fontColor($r('app.color.color_white'))
            .fontSize($r('app.float.size_text_16'))
            .margin({ top: $r('app.float.size_10') })
        }
        .backgroundImage($r('app.media.back_mine'))
        .width("100%")
        .height($r('app.float.size_250'))
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        this.itemBuilder("关注", $r('app.media.icon_focus'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "focus" } as ContainerRouteParams)
        })
        this.itemBuilder("分类", $r('app.media.icon_type'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "category" } as ContainerRouteParams)
        })
        this.itemBuilder("热门", $r('app.media.icon_topic'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "topic" } as ContainerRouteParams)
        })
        this.itemBuilder("测试Result校验", $r('app.media.icon_topic'), () => {
          // Router.push(RoutePath.TestPage)
        })
        this.itemBuilder("CoordinateLayout", $r('app.media.icon_topic'), () => {
          // Router.push(RoutePath.CoordinatePage)
          // StorageUtils.get(StorageKeys.USER_INFO_KEY, "").then(result => {
          //   LogUtils.debug(`测试Storage>>>>>>${result}`)
          // })
        })
        this.itemBuilder("HorizontalScroll1", $r('app.media.icon_topic'), () => {
          // Router.push(RoutePath.TestHorizontalPage)
        })
        this.itemBuilder("HorizontalScroll2", $r('app.media.icon_topic'), () => {
          // Router.push(RoutePath.TestHorizontalPage2)
        })
        this.itemBuilder("关于", $r('app.media.icon_about'), () => {
          this.dialogController?.open()
        })
      }

    }
  }

  @Builder
  itemBuilder(title: string, icon: Resource, onItemClick?: () => void) {
    Stack({ alignContent: Alignment.Bottom }) {
      Row() {
        Image(icon).width($r('app.float.size_25')).height($r('app.float.size_25'))
        Text(title)
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_333'))
          .margin({ left: $r('app.float.size_10') })
      }.height($r('app.float.size_50'))
      .width("100%")
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.size_10') })

      Divider().color($r('app.color.color_f5f5f5'))
        .width("100%")
    }.height($r('app.float.size_50'))
    .width("100%")
    .onClick(() => {
      onItemClick?.()
    })
  }
}