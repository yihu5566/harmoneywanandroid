import { ArrayList } from "@kit.ArkTS"

@Component
export struct CommonSkeleton {
  @State dataList: Array<string> = new Array(5)

  aboutToAppear() {
    for (let index = 0; index < 3; index++) {
      this.dataList.push("")
    }
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.dataList, (item: string, index) => {
        ListItem() {
          this.itemBuild()
        }
      })
    }.height("100%").width("100%")
  }

  @Builder
  itemBuild() {
  }
}