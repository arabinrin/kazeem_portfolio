class PortfolioModel {
  final String? image;
  final String? name;
  final String? function;
  PortfolioModel({
    this.function,
    this.image,
    this.name,
  });
}

List<PortfolioModel> portfolios = [
  PortfolioModel(
    function: 'the mainstream agriculture produ ts and farm implements market ',
    image: 'assets/agrikmart.png',
    name: 'Agrikmart',
  ),
  PortfolioModel(
    function: 'For your furniture and hosuehold shopping',
    image: 'assets/funica.png',
    name: 'Funica',
  ),
  PortfolioModel(
    function: 'End-to-end chatting app with basic features and easy to use',
    image: 'assets/soro.png',
    name: 'Soro',
  ),
  PortfolioModel(
    function: 'The best ridign app to take over the market soon',
    image: 'assets/truride.png',
    name: 'Truride',
  ),
];
