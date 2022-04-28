import 'package:api_snowman/pages/cardsinformation.dart';
import 'package:api_snowman/request/cards_repository.dart';
import 'package:flutter/material.dart';

class CardsList extends StatefulWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  late CardsRepository cardsRepo;
  final loading = ValueNotifier(true);
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    cardsRepo = CardsRepository();
    loadCards();
  }

  infiniteScrolling() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !loading.value) {
      loadCards();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  loadCards() async {
    loading.value = true;
    await cardsRepo.getCards();
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: cardsRepo,
        builder: (context, snapshot) {
          return Container(
            color:Colors.transparent,
            alignment: Alignment.center,
            child: Stack(
              children: [
                ListView.separated(
                  controller: _scrollController,
                    itemBuilder: ((context, index) {
                      final card = cardsRepo.cards[index];
                      return Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(card.cropImage),
                fit: BoxFit.cover,
                opacity: 0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(40)
                )
              ),
              child: ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardsInformation(name: card.name, image: card.image, flavorText: card.flavorText,))),
                title: Text(card.name,
                textAlign: TextAlign.center,),
              ),
            ),
          );
                    }),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: cardsRepo.cards.length),
                loadingIndicatorWidget()
              ],
            ),
          );
        });
  }

  loadingIndicatorWidget() {
    return ValueListenableBuilder(
        valueListenable: loading,
        builder: (context, bool isLoading, _) {
          return (isLoading)
              ? Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - 20,
                  bottom: 24,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ))
              : Container();
        });
  }
}
