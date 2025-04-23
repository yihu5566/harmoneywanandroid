/**
 * 事件的EventNum
 */
export class EventKeys {
  //展示loading的事件处理EventID
  static readonly LOADING_DIALOG_EVENT = 0x10000
}

/**
 * 对应的事件
 */
interface GeneratedObjectLiteralInterface_1 {
  eventId: number;
}

export const loadingEvent: GeneratedObjectLiteralInterface_1 = {
  eventId: EventKeys.LOADING_DIALOG_EVENT
}