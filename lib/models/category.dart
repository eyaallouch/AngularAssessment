class Category {
  String thumbnail;
  String name;
  String technologies;

  Category({
    required this.name,
    required this.technologies,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Stagiaire',
    technologies: "Angular,Laravel,GitLab",
    thumbnail: 'images/asm.jfif',
  ),
  Category(
    name: 'ChatBot assistant',
    technologies: "Rasa, MongoDB, Trello, React",
    thumbnail: 'images/chatbot.jpg',
  ),
  Category(
    name: "Modéle prédictif d'assurance",
    technologies: "Data Mining",
    thumbnail: 'images/data-mining.jpg',
  ),
  Category(
    name: 'Location des vélos en ligne',
    technologies: "Vue.js,Laravel",
    thumbnail: 'images/velo.jpg',
  ),





];