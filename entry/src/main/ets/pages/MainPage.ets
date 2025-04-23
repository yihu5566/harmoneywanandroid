import router from '@ohos.router';
import { LoadingDialog } from '../view/LoadingDialog';
import emitter from '@ohos.events.emitter'
import { EventKeys, loadingEvent } from '../event/EventKeys'
import { GeneratedObjectLiteralInterface_2 } from '../event/LoadingDialogEvent';
import { HomePage } from './home/HomePage';
import { LogUtils } from '../utils/LogUtils';
import { TabItem } from '../model/TabItem';
import MainViewModel from '../viewmodel/MainViewModel';
import { it } from '@ohos/hypium';
import { CommonConstants } from '../constants/CommonConstants';
import { SystemDataPage } from './system/SystemDataPage';
import { ProjectPage } from './project/ProjectPage';
import { NavigationPage } from './navigation/NavigationPage';
import { WeChatNumberPage } from './gzh/WeChatNumberPage';


@Entry
@Component
struct MainPage {
  @State selectedIndex: number = 0
  @Provide homeTabSelected: number = 0
  @State loadingTips: string = "加载中..."
  @State loadingShow: boolean = false
  // 声明但不立即初始化
  private loadingDialogController?: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({ loadingTips: this.loadingTips }),
    autoCancel: false,
    gridCount: 2,
    cancel: () => {
      this.loadingShow = false
    }
  });

  aboutToAppear() {
    emitter.on(loadingEvent, (event: GeneratedObjectLiteralInterface_2) => {
      if (event.data.showLoading == true && !this.loadingShow) {
        this.loadingShow = true
        this.loadingTips = event.data.loadingTips
        this.loadingDialogController?.open()
      } else if (event.data.showLoading == false) {
        this.loadingDialogController?.close()
        this.loadingShow = false
      }
    })
  }

  aboutToDisappear() {
    emitter.off(EventKeys.LOADING_DIALOG_EVENT)
  }

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End,
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[0], 0))

        TabContent() {
          SystemDataPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[1], 1))

        TabContent() {
          ProjectPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[2], 2))

        TabContent() {
          NavigationPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[3], 3))

        TabContent() {
          WeChatNumberPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[4], 4))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight($r('app.float.tab_bar_height'))
      .onChange((index) => {
        this.selectedIndex = index
        this.homeTabSelected = index
      })
    }
  }

  onPageShow() {
    LogUtils.error("页面可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  onPageHide() {
    LogUtils.error("页面不可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  @Builder
  TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex == index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.tab_image_size'))
        .width($r('app.float.tab_image_size'))
        .margin({
          top: $r('app.float.tab_margin_top'),
          bottom: $r('app.float.tab_text_margin_bottom')
        })
      Text(item.title)
        .height($r('app.float.tab_image_size'))
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .fontSize($r('app.float.tab_text_font_size'))
        .fontWeight(CommonConstants.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? $r('app.color.color_red') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ bottom: $r('app.float.tab_text_margin_bottom') })
    }.justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor($r('app.color.color_f5f5f5'))

  }
}


