import router from '@ohos.router'

@Entry
@Component
struct Second {
  @State message: string = "second page"

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30).fontWeight(FontWeight.Bold)
        Button() {
          Text("Back").fontSize(25).fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick((event: ClickEvent) => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          try {
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
          }
        })
      }.width('100%')
    }.height('100%')
  }
}