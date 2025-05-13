export class BaseDataSourceWrapper<T> implements IDataSource {
  private list: T[] = []
  private listener?: DataChangeListener

  constructor(list: T[]) {
    this.list = list;
  }


  totalCount(): number {
    return this.list.length
  }

  getData(index: number) {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    throw new Error("Method not implemented.");
  }
}