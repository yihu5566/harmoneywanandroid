import router from "@ohos.router";
import { LogUtils } from "../utils/LogUtils";

export class Router {
  static push(url: string, params?: object) {
    router.pushUrl({ url, params }, router.RouterMode.Standard, (err) => {
      if (err) {
        LogUtils.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      LogUtils.info('pushUrl success' + url);
    })
  }
}