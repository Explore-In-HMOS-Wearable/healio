import { router } from '@kit.ArkUI';

interface Metric {
  title: string;
  icon: Resource;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  metrics: Metric[] = [
    { title: 'Calories', icon: $r('app.media.calories') },
    { title: 'Heart Rate', icon: $r('app.media.heart') },
    { title: 'Step Count', icon: $r('app.media.step')},
    { title: 'Body Temp', icon: $r('app.media.temp')},
  ];

  @Builder
  buildCard(item: Metric, routeName: string) {
    Column() {
      Image(item.icon)
        .width(30)
        .height(30)
        .objectFit(ImageFit.Contain)
        .margin({ bottom: 10 })

      Text(item.title)
        .fontSize(9)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
    }
    .width(50)
    .height('30%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .margin(5)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      router.pushUrl({ url: routeName })
    })
  }

  build() {
    Column() {
      Text('Your Activities')
        .fontColor(Color.Black)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .padding({ bottom: 10 })

      Column() {
        Row({ space: 10 }) {
          this.buildCard(this.metrics[0], 'pages/Calorie')
          this.buildCard(this.metrics[1], 'pages/HeartRate')
        }
        Row({ space: 10 }) {
          this.buildCard(this.metrics[2], 'pages/StepCount')
          this.buildCard(this.metrics[3], 'pages/BodyTemp')
        }
      }

      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#f0f0f3')
  }
}
