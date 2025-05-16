@Entry
@Component
export struct MinePage {
  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')

  aboutToAppear() {

  }

  aboutToDisappear() {
    //TODO 这里没有
    // this.dialogController = null;
  }

  build() {

  }
}