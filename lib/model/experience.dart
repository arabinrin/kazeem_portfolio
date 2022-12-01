class ExperienceModel {
  final String? role;
  final String? period;
  final String? place;
  final List<String>? duties;

  ExperienceModel(
      {required this.role,
      required this.duties,
      required this.period,
      required this.place});
}

List<ExperienceModel> experiences = [
  ExperienceModel(
      role: 'MOBILE APPLICATION DEVELOPER',
      duties: [
        ' I participate in the development of a Social app called GeniusPark and a ﬁntech mobile application, Billable',
        'g up recurrent payments of bills without the need to authenticate every time it came up.',
        ' I participated in building a picture media android application that allows users to have access to HD pictures of any tag or title, using both a web-crawling algorithm and Google photo API ',
      ],
      period: 'AUGUST 2021 -FEBRUARY 2022 ',
      place: ' GENIUSPARK(REMOTE). '),
  ExperienceModel(
    role: 'FLUTTER DEVELOPER',
    duties: [
      ' Restructuring of the preexisting Agritech product by the company, Agrikmart to suit the present market form. ',
      ' Redesigning and rebuilding Agrikmart with an overhaul of the database from Firebase to Restful API',
      ' Optimizing the runtime logic of Agrkmart to tackle the problem of low performance and memory leakage. ',
    ],
    period: 'MOBILE APPLICATION DEVELOPER',
    place: ' INTRAVENT TECHNOLOGIES LIMITED ',
  ),
  ExperienceModel(
    role: 'DATA SCIENCE INTERN',
    duties: [
      'I analyzed University data at Media and Information Services, University of Ibadan ',
      'ob used analytics tools available on Ananconda distribution to clean up data, perform exploratory analysis, and help the University interpret the data ',
      'Machine learning models are often used to make projections and to analyze complex data like Natural language or non-nominal opinion data',
    ],
    period: 'AUGUST 2018 - JUNE 2019',
    place: 'University of Ibadan, Ibadan.',
  ),
];
