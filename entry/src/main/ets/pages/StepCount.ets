@Entry
@Component
struct StepCount {
  @State message: string = 'Hello World';
  @State steps: number[] = [3000, 4500, 7000, 9000, 6000, 4000, 2000];
  days: string[] = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat', 'Sun'];

  readonly maxSteps: number = 10000;
  readonly maxBarHeight: number = 100;

  build() {
    RelativeContainer() {
      Column() {
        Text('Weekly Activity')
          .fontColor(Color.Black)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20});

        Stack(){
          Column()
            .backgroundColor(Color.White)
            .borderRadius(8)
            .width('80%')
            .height('50%')
          Row() {
            ForEach(this.steps, (value: number, index: number) => {
              Column() {
                Blank()
                  .height((value / this.maxSteps) * this.maxBarHeight)
                  .width('10%')
                  .backgroundColor('#9a679e')
                  .borderRadius(4);

                Text(this.days[index])
                  .fontSize(10)
                  .fontColor(Color.Black)
                  .width('12%')
                  .textAlign(TextAlign.Center);
              }
              .alignItems(HorizontalAlign.Center);
            }, (value: number, index: number) => index.toString())
          }
          .width('100%')
          .height('75%')
          .alignItems(VerticalAlign.Bottom)
          .padding({bottom: 35, left: 35})
        }
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f0f0f3')
  }
}