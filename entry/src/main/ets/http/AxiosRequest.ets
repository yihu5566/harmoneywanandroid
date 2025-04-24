/**
 * axios请求客户端创建
 */

import { AxiosError, AxiosRequestHeaders, AxiosResponse } from "@ohos/axios";
import { CommonType } from "../model/typeAlias/TypeAlias";
import { LogUtils } from "../utils/LogUtils";
import AxiosHttpRequest, { HttpRequestConfig } from "./AxiosHttp";

const axiosClient = new AxiosHttpRequest({
  baseURL: "/api",
  timeout: 10 * 1000,
  checkResultCode: false,
  headers: {
    'Content-Type': 'application/json'
  } as AxiosRequestHeaders,
  interceptorHooks: {
    requestInterceptor: async (config) => {
      // 在发送请求之前做一些处理，例如打印请求信息
      LogUtils.debug('网络请求Request 请求方法:', `${config.method}`);
      LogUtils.debug('网络请求Request 请求链接:', `${config.url}`);
      // LogUtils.debug('网络请求Request Params:', `\n${JsonUtils.stringify(config.params)}`);
      // LogUtils.debug('网络请求Request Data:', `${JsonUtils.stringify(config.data)}`);
      axiosClient.config.showLoading = config.showLoading
      if (config.showLoading) {
        // showLoadingDialog("加载中...")
      }
      if (config.checkLoginState) {

      }
      return config
    },
    requestInterceptorCatch: (err) => {
      LogUtils.error("网络请求RequestError", err?.toString())
      if (axiosClient.config.showLoading) {
        // hideLoadingDialog()
      }
      return err;
    },
    responseInterceptor: (response: AxiosResponse) => {
      if (response.status === 200) {
        let config = response.config as HttpRequestConfig
        const checkResultCode = config.checkResultCode
        if (checkResultCode && response.data.errorCode != 0) {
          // showToast(response.data.errorMsg)
          return Promise.reject(response)
        }
        return Promise.resolve(response.data);
      } else {
        return Promise.reject(response);
      }
    },
    responseInterceptorCatch: (error) => {
      if (axiosClient.config.showLoading) {
        // hideLoadingDialog()
      }
      LogUtils.error("网络请求响应异常", error?.toString())
      errorHandler(error);
      return Promise.reject(error);
    }
  }
});


export function errorHandler(error: CommonType) {
  if (error instanceof AxiosError) {
    // showToast(error.message)
  }
}

export default axiosClient;