/**
 * 展示Loading的Event
 * @param showLoading
 * @param "
 * @returns
 */
interface GeneratedObjectLiteralInterface_1 {
  "showLoading": boolean;
  "loadingTips": string;
}

export interface GeneratedObjectLiteralInterface_2 {
  data: GeneratedObjectLiteralInterface_1;
}

export function LoadingDialogEvent(showLoading: boolean, loadingTips: string = "加载中...") {
  return ({
    data: ({
      "showLoading": showLoading,
      "loadingTips": loadingTips
    } as GeneratedObjectLiteralInterface_1)
  } as GeneratedObjectLiteralInterface_2)
}