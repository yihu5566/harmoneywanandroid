import { router } from '@kit.ArkUI'

@Entry
@Component
struct SplashPage {
  aboutToAppear(): void {
    setTimeout(() => {
      router.replaceUrl({ url: RoutePath.MainPage })
    }, 2000)
  }

  build() {
    RelativeContainer() {

    }
    .height('100%')
    .width('100%')
  }
}