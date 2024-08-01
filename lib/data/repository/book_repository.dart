import 'package:liblary_new/data/model/book.dart';

class BookRepository {
  static List<Book> books = [
    Book(
      title: 'Clean Code',
      author: 'Robert C. Martin',
      description: 'A Handbook of Agile Software Craftsmanship',
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/51b7XbfMIIL._SX374_BO1,204,203,200_.jpg',
      downloadUrl:
          'https://kolegite.com/EE_library/books_and_lectures/%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%B8%D1%80%D0%B0%D0%BD%D0%B5/Clean%20Code%20-%20%20A%20Handbook%20of%20Agile%20Software%20Craftsmanship.pdf',
    ),
    Book(
      title: 'Effective Java',
      author: 'Joshua Bloch',
      description: 'Best practices for the Java platform',
      imageUrl:
          'https://www.oreilly.com/api/v2/epubs/9781492069669/files/images/9783960886396.jpg',
      downloadUrl:
          'https://kea.nu/files/textbooks/new/Effective%20Java%20%282017%2C%20Addison-Wesley%29.pdf',
    ),
    Book(
      title: 'Design Patterns',
      author: 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides',
      description: 'Elements of Reusable Object-Oriented Software',
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348027904i/85009.jpg',
      downloadUrl: 'https://www.javier8a.com/itc/bd1/articulo.pdf',
    ),
    Book(
      title: 'Refactoring',
      author: 'Martin Fowler',
      description: 'Improving the Design of Existing Code',
      imageUrl:
          'https://m.media-amazon.com/images/I/71TGolfP8fL._AC_UF1000,1000_QL80_.jpg',
      downloadUrl:
          'https://dl.ebooksworld.ir/motoman/Refactoring.Improving.the.Design.of.Existing.Code.2nd.edition.www.EBooksWorld.ir.pdf',
    ),
    Book(
      title: 'The Pragmatic Programmer',
      author: 'Andrew Hunt, David Thomas',
      description: 'Your Journey to Mastery',
      imageUrl:
          'https://m.media-amazon.com/images/I/71f1jieYHNL._AC_UF1000,1000_QL80_.jpg',
      downloadUrl:
          'https://ia802308.us.archive.org/19/items/c-26_20211009/C26.pdf',
    ),
    Book(
      title: 'Code Complete',
      author: 'Steve McConnell',
      description: 'A Practical Handbook of Software Construction',
      imageUrl:
          'https://m.media-amazon.com/images/I/61GzazUmKyL._AC_UF1000,1000_QL80_.jpg',
      downloadUrl:
          'https://people.engr.tamu.edu/slupoli/notes/ProgrammingStudio/supplements/Code%20Complete%202nd.pdf',
    ),
    Book(
      title: 'Introduction to the Theory of Computation',
      author: 'Michael Sipser',
      description: 'A comprehensive introduction to the theory of computation',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaVPL7g0dyTWWpPc01bGRCkxh7vwAX-jyg_w&s',
      downloadUrl:
          'https://mog.dog/files/SP2019/Sipser_Introduction.to.the.Theory.of.Computation.3E.pdf',
    ),
    Book(
      title: 'Artificial Intelligence: A Modern Approach',
      author: 'Stuart Russell, Peter Norvig',
      description:
          'The most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence',
      imageUrl: 'https://aima.cs.berkeley.edu/cover.jpg',
      downloadUrl:
          'https://people.engr.tamu.edu/guni/csce421/files/AI_Russell_Norvig.pdf',
    ),
    Book(
      title: 'Computer Networking: A Top-Down Approach',
      author: 'James Kurose, Keith Ross',
      description:
          'A comprehensive introduction to networking concepts and applications',
      imageUrl:
          'https://www.ucg.ac.me/skladiste/blog_44233/objava_64433/fajlovi/Computer%20Networking%20_%20A%20Top%20Down%20Approach,%207th,%20converted.pdf',
      downloadUrl:
          'https://faculty.kfupm.edu.sa/ICS/hussaing/shared/Computer%20Networking%20A%20Top-Down%20Approach%206th%20Edition.pdf',
    ),
    Book(
      title: 'Introduction to Algorithms',
      author:
          'Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein',
      description:
          'The comprehensive textbook covering the modern theory and practice of algorithms',
      imageUrl:
          'https://static.wixstatic.com/media/258e35_f228f435e9d247cba215c1879a8e0279~mv2.jpg/v1/fill/w_480,h_538,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/258e35_f228f435e9d247cba215c1879a8e0279~mv2.jpg',
      downloadUrl:
          'https://dl.ebooksworld.ir/books/Introduction.to.Algorithms.4th.Leiserson.Stein.Rivest.Cormen.MIT.Press.9780262046305.EBooksWorld.ir.pdf',
    ),
  ];
}
