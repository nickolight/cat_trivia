abstract class CatFactEvent {
  const CatFactEvent();
}

class DownloadCatFacts extends CatFactEvent {}

class GetRandomCatFact extends CatFactEvent {}
