-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 01:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sach`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `madonhang` int(11) NOT NULL,
  `masach` int(11) NOT NULL,
  `tensach` varchar(1000) NOT NULL,
  `giasach` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `tenkhachhang` varchar(200) NOT NULL,
  `sdt` int(11) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loaisach`
--

CREATE TABLE `loaisach` (
  `id` int(11) NOT NULL,
  `tenloaisach` varchar(200) NOT NULL,
  `hinhanhloaisach` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaisach`
--

INSERT INTO `loaisach` (`id`, `tenloaisach`, `hinhanhloaisach`) VALUES
(1, 'Sách Tiếng Việt', 'https://salt.tikicdn.com/ts/categoryblock/1f/39/56/21a249b92a62268e4d51bf75470370bf.png'),
(2, 'English Books', 'https://salt.tikicdn.com/ts/categoryblock/98/bb/9a/68076b684253fb354fc2019795b05afd.png');

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `id` int(11) NOT NULL,
  `tensach` varchar(200) NOT NULL,
  `giasach` int(15) NOT NULL,
  `hinhanhsach` varchar(200) NOT NULL,
  `mota` varchar(10000) NOT NULL,
  `idsach` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`id`, `tensach`, `giasach`, `hinhanhsach`, `mota`, `idsach`) VALUES
(1, 'Đừng lựa chọn an nhàn khi còn trẻ', 50000, 'https://salt.tikicdn.com/cache/200x200/ts/product/eb/62/6b/0e56b45bddc01b57277484865818ab9b.jpg', 'Trong độ xuân xanh phơi phới ngày ấy, bạn không dám mạo hiểm, không dám nỗ lực để kiếm học bổng, không chịu tìm tòi những thử thách trong công việc, không phấn đấu hướng đến ước mơ của mình. Bạn mơ mộng rằng làm việc xong sẽ vào làm ở một công ty nổi tiếng, làm một thời gian sẽ thăng quan tiến chức. Mơ mộng rằng khởi nghiệp xong sẽ lập tức nhận được tiền đầu tư, cầm được tiền đầu tư là sẽ niêm yết trên sàn chứng khoán. Mơ mộng rằng muốn gì sẽ có đó, không thiếu tiền cũng chẳng thiếu tình, an hưởng những năm tháng êm đềm trong cuộc đời mình. Nhưng vì sao bạn lại nghĩ rằng bạn chẳng cần bỏ ra chút công sức nào, cuộc sống sẽ dâng đến tận miệng những thứ bạn muốn? Bạn cần phải hiểu rằng: Hấp tấp muốn mau chóng thành công rất dễ khiến chúng ta đi vào mê lộ. Thanh xuân là khoảng thời gian đẹp đẽ nhất trong đời, cũng là những năm tháng then chốt có thể quyết định tương lai của một người. Nếu bạn lựa chọn an nhàn trong 10 năm, tương lai sẽ buộc bạn phải vất vả trong 50 năm để bù đắp lại. Nếu bạn bươn chải vất vả trong 10 năm, thứ mà bạn chắc chắn có được là 50 năm hạnh phúc. Điều quý giá nhất không phải là tiền mà là tiền bạc. Thế nên, bạn à, đừng lựa chọn an nhàn khi còn trẻ.', 1),
(2, 'Bạn đắt giá bao nhiêu?', 50000, 'https://salt.tikicdn.com/cache/200x200/ts/product/87/c9/c0/bfebf4adcb31c8eb5c39fd3779cc4b68.jpg', 'Bạn Đắt Giá Bao Nhiêu?\r\n\r\nCâu trả lời này do chính bạn quyết định, chính bạn “định giá”.\r\n\r\nHơn bốn mươi câu chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình huống của chính mình. Với những câu chuyện đó, Vãn Tình hi vọng có thể giúp các cô gái thoát khỏi tình cảnh khó khăn, tìm lại bản ngã, sống cuộc đời theo cách mà mình mong muốn.\r\n\r\nĐọc cuốn sách này, đôi khi bạn nên dừng lại và thành thực với bản thân, liệu bạn có đang là phiên-bản-mà-bạn-yêu-thích-nhất, phiên-bản-bạn-mong- muốn-trở-thành. Hãy thử trả lời các câu hỏi: Sự thỏa hiệp có làm bạn hạnh phúc hay không? Bạn có đang cố gắng lấy lòng tất cả mọi người? Bạn có dám thay đổi?... Và quan trọng nhất: Bạn đắt giá bao nhiêu?\r\n\r\n “Khi chúng ta đủ xuất sắc và thông tuệ, chúng ta sẽ có được một trái tim thông thái và một đôi mắt trong trẻo, nhìn thấu thực tại và sự khắc nghiệt của thế gian, phân biệt được mọi thị phi sai đúng, nhưng vẫn sống tự tin và nhiệt tình. Hi vọng chúng ta đều sẽ trở thành một cô gái như vậy…”\r\n\r\n“Các cô gái thân mến, mong rằng sự trưởng thành của chúng ta không phải đến từ sự thương tổn.\r\n\r\nKhông cần trở thành một cô gái được tất-cả-mọi-người yêu quý, nhưng nhất định phải trở thành một cô gái mà chính-mình-yêu-thích.”\r\n\r\n“Trong chúng ta, có rất nhiều người cố gắng cả đời cũng không thể tìm thấy tình yêu chân thành, bởi vì chúng ta đã thỏa hiệp với cuộc sống trước khi tình yêu ấy xuất hiện.”', 1),
(3, 'Đắc nhân tâm', 50000, 'https://salt.tikicdn.com/cache/200x200/ts/product/df/7d/da/cc713d2bcecd12ba82d5596ddbcac2d7.jpg', 'Đắc nhân tâm của Dale Carnegie là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Được xuất bản năm 1936, với số lượng bán ra hơn 15 triệu bản, tính đến nay, sách đã được dịch ra ở hầu hết các ngôn ngữ, trong đó có cả Việt Nam, và đã nhận được sự đón tiếp nhiệt tình của đọc giả ở hầu hết các quốc gia.\r\n\r\nLà quyển sách đầu tiên có ảnh hưởng làm thay đổi cuộc đời của hàng triệu người trên thế giới, Đắc Nhân Tâm là cuốn sách đem lại những giá trị tuyệt vời cho người đọc, bao gồm những lời khuyên cực kì bổ ích về cách ứng xử trong cuộc sống hàng ngày. Sức lan toả của quyển sách vô cùng rộng lớn – với nhiều tầng lớp, đối tượng.\r\n\r\nĐắc Nhân Tâm không chỉ là là nghệ thuật thu phục lòng người, Đắc Nhân Tâm còn đem lại cho độc giả góc nhìn, suy nghĩ sâu sắc về việc giao tiếp ứng xử.\r\n\r\nTriết lý của Đắc Nhân Tâm là hiểu mình, thành thật với chính mình, từ đó hiểu biết và quan tâm đến những người xung quanh để nhìn ra và khơi gợi những tiềm năng ẩn khuất nơi họ, giúp họ phát triển lên một tầm cao mới. Đây chính là nghệ thuật cao nhất về con người và chính là ý nghĩa sâu sắc nhất đúc kết từ những nguyên tắc vàng của Dale Carnegie.\r\n\r\nĐây là phiên bản Đắc Nhân Tâm đặc biệt, bìa cứng dày 320 trang, do First News thực hiện và Nhà xuất bản Tổng hợp TP.HCM ấn hành.\r\n\r\nĐắc Nhân Tâm (Bìa Cứng) - Tái Bản\r\n\r\nMột số nguyên tắc – Nghệ thuật ứng xử căn bản:\r\n\r\nNguyên tắc 1: Không chỉ trích, oán trách hay than phiền.\r\n\r\nNguyên tắc 2: Thành thật khen ngợi và biết ơn người khác.\r\n\r\nNguyên tắc 3: Gợi cho người khác ý muốn thực hiện điều bạn muốn họ làm.\r\n\r\n6 cách tạo thiện cảm:\r\n\r\nNguyên tắc 4: Thật lòng quan tâm đến người khác.\r\n\r\nNguyên tắc 5: Hãy mỉm cười!\r\n\r\nNguyên tắc 6: Luôn nhớ rằng tên của người khác là một âm thâm êm đềm, thân thương và quan trọng nhất đối với họ.\r\n\r\nNguyên tắc 7: Biết lắng nghe và khuyến khích người khác nói về vấn đề của họ.\r\n\r\nNguyên tắc 8: Nói về điều người khác quan tâm.\r\n\r\nNguyên tắc 9: Thật lòng làm cho người khác cảm thấy họ quan trọng.\r\n\r\n\r\nBáo chí nhắc gì về “Đắc Nhân Tâm”\r\n\r\n“Nói đến sách nghệ thuật ứng xử thì không thể không nhắc đến \"Đắc nhân tâm\" của Dale Carnegie. Đây là một trong những cuốn sách gối đầu của nhiều thế hệ đi trước và ngày nay. Với chặng đường hơn 80 năm kể từ khi lần đầu được xuất bản, \"Đắc nhân tâm\" đã mang đến cho chúng ta bài học vô cùng giá trị đó là nghệ thuật ứng xử để được lòng người. \"Đắc nhân tâm\" là quyển sách nổi tiếng và bán chạy nhất và có mặt ở hàng trăm quốc gia khác nhau, và hơn thế nữa đây còn là quyển sách liên tục đứng đầu danh mục sách bán chạy nhất do thời báo NewYork Times bình chọn trọng suốt 10 năm liền.” – C, 3 cuốn sách nên đọc đi đọc lại trong đời để ngẫm về cuộc sống\r\n\r\n“Đắc Nhân Tâm – của tác giả Dale Carnegie là quyển sách nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất của mọi thời đại. Tác phẩm đã được chuyển ngữ sang hầu hết các thứ tiếng trên thế giới và có mặt ở hàng trăm quốc gia. Một khám phá rất thú vị dành cho các bậc phụ huynh khi đọc cuốn sách này là biết cách lắng nghe trò chuyện cùng con, cách trị chứng tè dầm của trẻ nhỏ, hay cách làm cho một đứa trẻ từ quậy phá thành ngoan ngoãn… Đó hẳn là những câu chuyện nuôi dạy trẻ rất đúng, rất hay, rất đời thường đáng để bạn đọc suy ngẫm và chiêm nghiệm”. – M, Đắc nhân tâm: ‘Cha đã quên’ nhắc những điều nên nhớ\r\n\r\n“Đắc Nhân Tâm” đưa ra những lời khuyên về cách cư xử, ứng xử và giao tiếp với mọi người để đạt được thành công trong cuộc sống. Đây được coi là một trong những cuốn sách nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất mọi thời đại mà bạn không nên bỏ qua.” – C, 20 câu nói vàng đáng nhớ từ tuyệt tác để đời “Đắc Nhân Tâm”.', 1),
(4, 'Cân Bằng Cảm Xúc, Cả Lúc Bão Giông', 56000, 'https://salt.tikicdn.com/cache/200x200/ts/product/fd/61/1d/a19424cfe9d113c32732d93cf2d5f59a.jpg', 'Một ngày, chúng ta có khoảng 16 tiếng tiếp xúc với con người, công việc, các nguồn thông tin từ mạng xã hội, loa đài báo giấy… Việc này mang đến cho bạn vô vàn cảm xúc, cả tiêu cực lẫn tích cực.\r\nBạn có thể thấy vui khi nhìn một em bé đến trường nhưng 5 phút sau đã nổi cơn tam bành khi bị đứa trẻ con đi xe đạp đâm sầm vào lại còn ăn vạ.\r\nHoặc bạn rất dễ phát điên nếu như chỉ còn 5 giây nữa đèn giao thông chuyển từ đỏ sang xanh mà kẻ đi đằng sau bấm còi inh ỏi.\r\nHay là, bạn thấy buồn chỉ vì hôm nay trời mưa man mác, mà vẫn phải ngồi trong văn phòng làm việc, bạn bi quan rằng tuổi trẻ thật buồn tẻ.\r\nHãy thừa nhận đi! Ai trong số chúng ta cũng sẽ trải qua những điều này. Và cuốn sách này dạy bạn cách làm hòa với chính những tiêu cực bên trong mình…\r\nĐa số những cảm xúc tiêu cực chỉ thỏa mãn được chúng ta ở thời điểm hiện tại. Tức là chúng ta có thể sẽ nhận được sự thoải mái khi la hét, cáu giận, chửi thề một ai đó nhưng những âm thanh ta phát ra, suy nghĩ ta truyền đi sẽ đóng vai một con dao sắc lẹm đâm ngược lại vào chính thân thể mình. Các mối quan hệ, cuộc sống, công việc của chúng ta sẽ dần rơi vào sự mệt mỏi, bế tắc.\r\nHọc được cách cân bằng cảm xúc cũng chính là học được cách làm chủ cuộc đời mình thông minh, sáng suốt và đúng hướng.\r\n“Cân bằng cảm xúc, cả lúc bão giông” khác biệt hoàn toàn so với những cuốn sách về cảm xúc thông thường khác khi:\r\nChỉ cho người đọc những lý do khiến chúng ta luôn tiêu cực và bản chất của những điều này là gì?\r\nNhững điều khiến chúng ta thường xuyên nóng giận và không hạnh phúc bắt nguồn từ đâu?\r\nĐưa ra những bài tập cụ thể để cân bằng cảm xúc mỗi ngày như: Ngừng suy nghĩ trong một khoảng thời gian cố định, tưởng tượng một quá trình, tập sống với bản thân mỗi ngày…\r\nCân bằng phương trình của cuộc đời không dễ, cuốn sách này không chỉ là lý thuyết còn cho bạn những kĩ năng, phướng pháp tận tình nhất để giúp bạn làm chủ cảm xúc của mình.', 1),
(5, 'Làm Chủ Tuổi 20 (Phiên bản mới) - Dành cho độc giả từ 16-30', 198000, 'https://salt.tikicdn.com/cache/280x280/ts/product/fa/45/68/5e001eb902a2c375f09374a4be07e7d5.png', 'Làm chủ tuổi 20 được viết lại dựa trên những trải nghiệm trong cuộc sống của tác giả Dương Duy Bách – một người sớm tự lập và đạt được nhiều thành công ở tuổi 20. Ngoài câu chuyện của chính mình, tác giả còn ghi lại những bài học mà anh học được từ những người trẻ thành công khác và phân tích lý do khách quan khiến họ đạt được mục tiêu khi tuổi đời còn rất trẻ.', 1),
(6, 'English Grammar in Use Book w Ans', 170000, 'https://salt.tikicdn.com/cache/200x200/ts/product/19/50/3b/18543018924618fbf07bf56433e8b1cd.jpg', 'The world\'s best-selling grammar series for learners of English. English Grammar in Use Fourth edition is an updated version of the world\'s best-selling grammar title. It has a fresh, appealing new design and clear layout, with revised and updated examples, but retains all the key features of clarity and accessibility that have made the book popular with millions of learners and teachers around the world. This \'with answers\' version is ideal for self-study. An online version, book without answers, and book with answers and CD-ROM are available separately.', 2),
(7, ' How To Win Friends And Influence People - Đắc Nhân Tâm', 17200, 'https://salt.tikicdn.com/cache/200x200/ts/product/c5/8d/a9/ff70e5ecc907027159a60f067e6a4b0f.jpg', 'How To Win Friends And Influence People\r\n\r\nThis is the most famous confidence-boosting book ever published; with sales of over 16 million copies worldwide Millions of people around the world have improved their lives based on the teachings of Dale Carnegie. In How to Win Friends and Influence People, he offers practical advice and techniques, in his exuberant and conversational style, for how to get out of a mental rut and make life more rewarding. His advice has stood the test of time and will teach you how to make friends quickly and easily; increase your popularity; persuade people to follow your way of thinking; enable you to win new clients and customers; become a better speaker; and boost enthusiasm among your colleagues. This classic book will turn your relationships around and improve your interactions with everyone in your life. Dale Carnegie, known as \'the arch-priest of the art of making friends\', pioneered the development of personal business skills, self-confidence and motivational techniques. His books - most notably How to Win Friends and Influence People - have sold tens of millions worldwide and, even in today\'s changing climate, they remain as popular as ever.', 2),
(8, 'The Little Prince - Hoàng Tử Bé', 74000, 'https://salt.tikicdn.com/cache/200x200/ts/product/99/ec/9a/f5f8a3f7e1f430c571cf8315e3b160ed.jpg', 'The Little Prince is a classic tale of equal appeal to children and adults. On one level it is the story of an airman\'s discovery, in the desert, of a small boy from another planet - the Little Prince of the title - and his stories of intergalactic travel, while on the other hand it is a thought-provoking allegory of the human condition. First published in 1943, the year before the author\'s death in action, this translation contains Saint-Exupery\'s delightful illustrations.', 2),
(9, 'Charlotte\'s Web', 137000, 'https://salt.tikicdn.com/cache/280x280/ts/product/ab/17/e0/991ce00cc6ade802d86b7dd9715c1096.jpg', 'Charlotte\'s Web\r\n\r\nThis is the story of a little girl named Fern who loved a little pig named Wilbur - and of Wilbur\'s dear friend Charlotte A. Cavatica, a beautiful large grey spider who lived with Wilbur in the barn. With the help of Templeton, the rat who never did anything for anybody unless there was something in it for him, and by a wonderfully clever plan of their own, Charlotte saved the life of Wilbur, who by this time had grown up to be quite a pig.', 2),
(10, 'Wonder (Paperback)', 168000, 'https://salt.tikicdn.com/cache/280x280/ts/product/3d/dd/d4/94dcc8f1290da143544b9c4da7e8042a.jpg', 'Wonder\r\n\r\n\"My name is August. I won\'t describe what I look like. Whatever you\'re thinking, it\'s probably worse.\" Auggie wants to be an ordinary ten-year-old. He does ordinary things - eating ice cream, playing on his Xbox. He feels ordinary - inside. But ordinary kids don\'t make other ordinary kids run away screaming in playgrounds. Ordinary kids aren\'t stared at wherever they go. Born with a terrible facial abnormality, Auggie has been home-schooled by his parents his whole life. Now, for the first time, he\'s being sent to a real school - and he\'s dreading it. All he wants is to be accepted - but can he convince his new classmates that he\'s just like them, underneath it all? Wonder is a funny, frank, astonishingly moving debut to read in one sitting, pass on to others, and remember long after the final page.', 2),
(11, 'Nhà Giả Kim', 44000, 'https://salt.tikicdn.com/cache/200x200/ts/product/66/5f/5a/312bac222584d52fea5e9d644369b254.jpg', 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.\r\n\r\nTiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.\r\n\r\n“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”\r\n\r\n- Trích Nhà giả kim', 1),
(12, ' Nóng Giận Là Bản Năng , Tĩnh Lặng Là Bản Lĩnh', 66000, 'https://salt.tikicdn.com/cache/200x200/ts/product/70/9a/98/e6d54019a2079b9565114bce93b245b7.jpg', 'Sai lầm lớn nhất của chúng ta là đem những tật xấu, những cảm xúc tiêu cực trút bỏ lên những người xung quanh, càng là người thân càng dễ gây thương tổn.\r\n\r\nCái gì cũng nói toạc ra, cái gì cũng bộc lộ hết không phải là thẳng tính, mà là thiếu bản lĩnh. Suy cho cùng, tất cả những cảm xúc tiêu cực của con người đều là sự phẫn nộ dành cho bất lực của bản thân. Nếu bạn đúng, bạn không cần phải nổi giận. Nếu bạn sai, bạn không có tư cách nổi giận.\r\n\r\nĐem một nắm muối bỏ vào cốc nước, cốc nước trở nên mặn chát. Đem một nắm muối bỏ vào hồ nước, hồ nước vẫn ngọt lành. Lòng người cũng vậy, càng nông cạn càng dễ biến chất, càng sâu sắc càng khó lung lay. Ý nghĩa của đời người không ngoài việc tu tâm dưỡng tính, để mở lòng ra bao la như biển hồ, trước những nắm muối thị phi của cuộc đời vẫn thản nhiên không xao động.\r\n\r\n“Nóng giận là bản năng, tĩnh lặng là bản lĩnh” là từ bỏ “tam độc”, tu dưỡng một trái tim trong sáng:\r\n\r\nTừ bỏ “tham” – bớt một phần ham muốn, thêm một phần tự do.\r\nTừ bỏ “sân” – bớt một phần tranh chấp, thêm một phần ung dung.\r\nTừ bỏ “si” – bớt một phần mê muội, thêm một phần tĩnh tâm.\r\nCuốn sách là tập hợp những bài học, lời tâm sự về nhân sinh, luận về cuộc đời của đại sư Hoằng Nhất – vị tài tử buông mọi trần tục để quy y cửa Phật, người được mệnh danh tinh thông kim cổ và cũng có tầm ảnh hưởng lớn trong Phật giáo.\r\n\r\nTrưởng thành, hãy để lòng rộng mở, tiến gần đến chữ “Người”, học được cách bao dung, học được cách khống chế cảm xúc. Đừng để những xúc động nhất thời như ngọn lửa, tưởng thiêu rụi được kẻ thù mà thực ra lại làm bỏng tay ta trước.', 1),
(13, 'CẨM NANG MUA BÁN ĐẤT', 180000, 'https://salt.tikicdn.com/cache/280x280/ts/product/ed/98/4e/75b65da9a6f8862fda73f3dde7b34d6e.jpg', 'CUỐN SÁCH DÀNH CHO AI?\r\n\r\nBạn muốn có một căn nhà mới đúng ý mình. Vậy trước tiên bạn phải mua một mảnh đất. Bây giờ “tấc đất, tấc vàng”, mua bán đất là giao dịch tiền tỷ. Trong khi ngoài kia mua bán nhà đất cùng những trò lừa bịp, những vụ tranh chấp “tiền mất – kiện mang” xảy ra hàng ngày. Vậy làm thế nào để lựa chọn được một mảnh đất “như ý” - vị trí tốt, hợp pháp, giá cả hợp lý, đối tác tin tưởng và nhanh chóng giao dịch thành công? Cẩm nang Mua bán đất có đủ câu trả lời cho bạn.\r\n\r\nTrong nhiều năm qua đầu tư đất nền luôn “hot”. Đã bao người thành công và kiếm được hàng chục tỷ đồng trong thời gian ngắn. Mua đất để đó, rồi chờ cầu thông, đường tới và có lời tiền tỷ thật là nhàn hạ! Nhưng không phải ai cũng may mắn vậy. Nhiều người đã thất bại “mất cả chì lẫn chài”, do “vận xui” cũng có, xong phần lớn là do thiếu kiến thức, thiếu kinh nghiệm trong mua bán đất. Biết bao nhiêu “chiêu trò” được chủ đầu tư, người bán sử dụng để lấy tiền của khách hàng. Cuốn sách này không chỉ giúp bạn nắm vững pháp lý mà còn cho bạn các “mưu hay, kế lạ” để gặt hái thành công. Cẩm nang Mua bán đất là dành cho bạn.\r\n\r\nBạn là nhà môi giới bất động sản chuyên nghiệp, tuyệt vời! Bạn không chỉ là người kết nối cho bên mua, bên bán. Bạn còn là người tư vấn về vị trí, pháp lý, giá cả của thửa đất. Hỗ trợ bên mua, bên bán thực hiện các thủ tục pháp lý trong ký kết hợp đồng và sang tên sổ đỏ. Cuốn sách này sẽ cho bạn thêm nhiều “chiêu hay” để “chốt khách”; Giúp bạn trở nên chuyên nghiệp và uy tín hơn trong mắt khách hàng. Hãy để Cẩm nang Mua bán đất đồng hành với bạn.\r\n\r\nTôi rất vui nếu bạn là cử nhân luật, luật gia, luật sư vì chúng ta là đồng nghiệp. Bạn đã biết pháp luật và thực tiễn luôn có khoảng cách. Thực tế vận dụng pháp luật trong giao dịch nhà đất rất phong phú và đầy thú vị. Tôi may mắn được trải nghiệm nghề luật sư trong lĩnh vực bất động sản hơn 18 năm qua, để gom những “câu chuyện quý giá” từ thực tiễn vào cuốn sách này. Khách hàng sẽ rất hài lòng và kính phục những chuyên gia tư vấn giúp họ bảo vệ quyền lợi bằng những giải pháp thực tế. Cuốn sách này sẽ giúp bạn có được điều đó.\r\n\r\nBạn là người thích khám phá những điều mới mẻ, “học nữa, học mãi” để thay đổi và tiến bộ mỗi ngày. Cẩm nang Mua bán đất là dành cho bạn.', 1),
(14, 'Sống Có Kế Hoạch', 110000, 'https://salt.tikicdn.com/cache/280x280/ts/product/8a/15/0b/aa934bd4fad7c5181e54bd58fc6f0218.jpg', '\"Sống Có Kế Hoạch\" giúp bạn thực hiện cách sử dụng danh sách để có năng suất cao hơn, thành công cao và ít căng thẳng hơn trong cuộc sống bộn bề. Sách đã được dịch sang 12 ngôn ngữ và đã được đăng trên nhiều phương tiện truyền thông bao gồm Fox News , Fox Business, Prevention, Business Insider, Entrepreneur, Brides và được trang O’s chọn đăng trong danh sách  “Self Help Books That Actually Help.\"\r\nKhông phải bất cứ ai sinh ra cũng thừa hưởng bộ gen thích sắp xếp và lên kế hoạch. Bạn là người thích sáng tạo, phóng khoáng, tự do. Bạn nghĩ rằng làm việc theo một quy trình trật tự sẽ phá hủy óc sáng tạo và làm suy giảm tính cách vui vẻ của mình. Bạn muốn làm việc với năng suất cao cũng như có tổ chức hơn, nhưng không muốn biến mình thành một kẻ nhàm chán.', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loaisach`
--
ALTER TABLE `loaisach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `loaisach`
--
ALTER TABLE `loaisach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
