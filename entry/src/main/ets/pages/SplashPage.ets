import { router } from '@kit.ArkUI'
import { RoutePath } from '../route/RoutePath'

@Entry
@Component
struct SplashPage {
  aboutToAppear(): void {
    setTimeout(() => {
      router.replaceUrl({ url: RoutePath.MainPage })
    }, 2000)
  }

  build() {
    Stack() {
      Image($r('app.media.splash_bg')).objectFit(ImageFit.ScaleDown)
    }.width("100%").height("100%")
    .backgroundColor($r('app.color.color_white'))
    .alignContent(Alignment.Center);
  }
}