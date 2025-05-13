import { TabItem } from '../model/TabItem';

/**
 * MainAbility的ViewModel
 */
export class MainViewModel {
  /**
   * 首页底部Tab显示数据
   */
  tabTitle: Array<TabItem> = [
    {
      index: 0,
      title: "首页",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 1,
      title: "发现",
      imageActivated: $r('app.media.icon_sel_find'),
      imageOriginal: $r('app.media.icon_unsel_find')
    },
    {
      index: 2,
      title: "项目",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 3,
      title: "导航",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 4,
      title: "体系",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;