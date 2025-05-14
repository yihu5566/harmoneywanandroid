export interface TopicDetailModel {
  id?: number;
  headerImage?: string;
  brief?: string;
  text?: string;
  shareLink?: string;
  itemList?: TopicDetailModelItemList[];
  count?: number;
  adTrack?: string;
}

export interface TopicDetailModelItemListDataHeader {
  id: number;
  actionUrl: string;
  labelList?: string;
  icon: string;
  iconType: string;
  time: number;
  showHateVideo: boolean;
  followType: string;
  tagId: number;
  tagName?: string;
  issuerName: string;
  topShow: boolean;
}

export interface TopicDetailModelItemListDataContentDataTags {
  id: number;
  name: string;
  actionUrl: string;
  adTrack?: string;
  desc?: string;
  bgPicture: string;
  headerImage: string;
  tagRecType: string;
  childTagList?: string;
  childTagIdList?: string;
  haveReward: boolean;
  ifNewest: boolean;
  newestEndTime?: string;
  communityIndex: number;
}

export interface TopicDetailModelItemListDataContentDataConsumption {
  collectionCount: number;
  shareCount: number;
  replyCount: number;
  realCollectionCount: number;
}

export interface TopicDetailModelItemListDataContentDataProvider {
  name: string;
  alias: string;
  icon: string;
}

export interface TopicDetailModelItemListDataContentDataAuthorFollow {
  itemType: string;
  itemId: number;
  followed: boolean;
}

export interface TopicDetailModelItemListDataContentDataAuthorShield {
  itemType: string;
  itemId: number;
  shielded: boolean;
}

export interface TopicDetailModelItemListDataContentDataAuthor {
  id: number;
  icon: string;
  name: string;
  description: string;
  link: string;
  latestReleaseTime: number;
  videoNum: number;
  adTrack?: string;
  follow: TopicDetailModelItemListDataContentDataAuthorFollow;
  shield: TopicDetailModelItemListDataContentDataAuthorShield;
  approvedNotReadyVideoCount: number;
  ifPgc: boolean;
  recSort: number;
  expert: boolean;
}

export interface TopicDetailModelItemListDataContentDataCover {
  feed: string;
  detail: string;
  blurred: string;
  sharing?: string;
  homepage?: string;
}

export interface TopicDetailModelItemListDataContentDataWebUrl {
  raw: string;
  forWeibo: string;
}

export interface TopicDetailModelItemListDataContentDataPlayInfoUrlList {
  name: string;
  url: string;
  size: number;
}

export interface TopicDetailModelItemListDataContentDataPlayInfo {
  height: number;
  width: number;
  urlList: TopicDetailModelItemListDataContentDataPlayInfoUrlList[];
  name: string;
  type: string;
  url: string;
}

export interface TopicDetailModelItemListDataContentData {
  dataType: string;
  id: number;
  title: string;
  description: string;
  library: string;
  tags: TopicDetailModelItemListDataContentDataTags[];
  consumption: TopicDetailModelItemListDataContentDataConsumption;
  resourceType: string;
  slogan?: string;
  provider: TopicDetailModelItemListDataContentDataProvider;
  category: string;
  author: TopicDetailModelItemListDataContentDataAuthor;
  cover: TopicDetailModelItemListDataContentDataCover;
  playUrl: string;
  thumbPlayUrl?: string;
  duration: number;
  webUrl: TopicDetailModelItemListDataContentDataWebUrl;
  releaseTime: number;
  playInfo: TopicDetailModelItemListDataContentDataPlayInfo[];
  campaign?: string;
  waterMarks?: string;
  ad: boolean;
  adTrack: string[];
  type: string;
  titlePgc: string;
  descriptionPgc: string;
  remark: string;
  ifLimitVideo: boolean;
  searchWeight: number;
  brandWebsiteInfo?: string;
  videoPosterBean?: string;
  idx: number;
  shareAdTrack?: string;
  favoriteAdTrack?: string;
  webAdTrack?: string;
  date: number;
  promotion?: string;
  label?: string;
  labelList: string[];
  descriptionEditor: string;
  collected: boolean;
  reallyCollected: boolean;
  played: boolean;
  subtitles: string[];
  lastViewTime?: string;
  playlists?: string;
  src?: string;
  recallSource?: string;
  recall_source?: string;
}

export interface TopicDetailModelItemListDataContent {
  type: string;
  data: TopicDetailModelItemListDataContentData;
  trackingData?: string;
  tag?: string;
  id: number;
  adIndex: number;
}

export interface TopicDetailModelItemListData {
  dataType: string;
  header: TopicDetailModelItemListDataHeader;
  content: TopicDetailModelItemListDataContent;
  adTrack: string[];
}

export interface TopicDetailModelItemList {
  type: string;
  data: TopicDetailModelItemListData;
  trackingData?: string;
  tag?: string;
  id: number;
  adIndex: number;
}