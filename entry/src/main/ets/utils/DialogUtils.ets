import { emitter } from "@kit.BasicServicesKit";
import { loadingEvent } from "../event/EventKeys";
import { LoadingDialogEvent } from "../event/LoadingDialogEvent";

export function showLoadingDialog(tips: string = "加载中") {
  emitter.emit(loadingEvent, LoadingDialogEvent(true, tips))
}

export function hideLoadingDialog() {
  emitter.emit(loadingEvent, LoadingDialogEvent(false, ""))
}