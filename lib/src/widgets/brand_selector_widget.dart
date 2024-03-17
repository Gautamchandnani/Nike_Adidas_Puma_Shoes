// ignore_for_file: unused_field

import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/utils/widget.dart';

class BrandSelector extends StatefulWidget {
  const BrandSelector({super.key});

  @override
  State<BrandSelector> createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector>
    with TickerProviderStateMixin {
  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        //TabBar
        Container(
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Constants.secondaryColor,
            unselectedLabelColor: Colors.grey[600],
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Constants.featuresColor,
            indicatorWeight: 3,
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
            tabs: [
              Tab(
                text: 'Nike',
              ),
              Tab(
                child: Text('Adidas'),
              ),
              Tab(child: Text('Puma')),
            ],
          ),
        ),
        //TabBar View
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: [
              NikeWidget(),
              AdidasWidget(),
              PumaWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
