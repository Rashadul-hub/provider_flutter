import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/slider_color_change_provider.dart';

class SliderColorChangeContainerScreen extends StatefulWidget {
  const SliderColorChangeContainerScreen({super.key});

  @override
  State<SliderColorChangeContainerScreen> createState() =>
      _SliderColorChangeContainerScreenState();
}

class _SliderColorChangeContainerScreenState
    extends State<SliderColorChangeContainerScreen> {
  @override
  Widget build(BuildContext context) {
    //final sliderColorChangeProvider = Provider.of<SliderColorChangeProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Slider Color Change Container(Provider)'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /** Provider Class is called here to change the view only for  => Slider Widget**/

            Consumer<SliderColorChangeProvider>(builder: (context, value , child){
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (newValue) {
                    value.setValue(newValue);
                  });

            }),

            /** Provider Class is called here to change the view only for => ROW Widget**/

            Consumer<SliderColorChangeProvider>(builder: (context, newValue , child){
              return  Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent
                              .withOpacity(newValue.value)),
                      child: const Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(newValue.value)),
                      child: const Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                ],
              );
            }),

          ],
        ));
  }
}
