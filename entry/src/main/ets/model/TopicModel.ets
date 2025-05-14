export interface TopicModel {
  itemList: TopicModelItemList[];
  count: number;
  total: number;
  nextPageUrl: string;
  adExist: boolean;
}
export interface TopicModelItemListDataLabel {
  text: string;
  card: string;
  detail?: string;
}
export interface TopicModelItemListData {
  dataType: string;
  id: number;
  title: string;
  description: string;
  image: string;
  actionUrl: string;
  adTrack: string[];
  shade: boolean;
  label: TopicModelItemListDataLabel;
  labelList: string[];
  header?: string;
  autoPlay: boolean;
}
export interface TopicModelItemList {
  type: string;
  data: TopicModelItemListData;
  trackingData?: string;
  tag?: string;
  id: number;
  adIndex: number;
}