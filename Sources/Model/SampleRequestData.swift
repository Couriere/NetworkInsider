//
//  -=Network Insider=-
//
// MIT License
//
// Copyright (c) 2021-present Vladimir Kazantsev
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

#if DEBUG

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func _debug_setSampleRequests() {
	sampleRequests.forEach { RequestsStorage.shared.insert( $0 ) }
}


let sampleRequestURL = "https://httpbin.org/post"

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
let sampleRequests = [
	createRequest( url: sampleRequestURL ),

	createRequest(
		url: sampleRequestURL,
		response: HTTPURLResponse(
			url: URL( string: sampleRequestURL )!,
			statusCode: 200,
			httpVersion: nil,
			headerFields: [ "Test" : "Response headers" ]
		)!
	),

	createRequest(
		url: "https://report.appmetrica.yandex.appmetrica.net/report?ifa=00000000-0000-0000-0000-000000000000&app_build_number=151&analytics_sdk_version_name=3.17.0&limit_ad_tracking=1&screen_height=896&is_rooted=0&app_debuggable=0&os_api_level=15&encrypted_request=1&app_platform=iOS&uuid=a2d31b08fbd14c34a076f7b7a6b689de&request_id=38&api_key_128=26b4d8de-506e-4cb4-ad40-d25a49211e2d&analytics_sdk_build_type=dynamic&app_id=ru.gpbmobile.lk&locale=ru_RU&attribution_id=1&app_version_name=1.12.0&manufacturer=Apple&screen_width=414&ifv=98FAD635-32B7-4105-A54E-BC191275779D&analytics_sdk_build_number=19976&deviceid=2AD2BA29-511C-4785-9035-E5D0C55A9CE1&model=iPhone12,1&os_version=15.1&screen_dpi=326&app_framework=native&scalefactor=2.00&device_type=phone",
		response: HTTPURLResponse(
			url: URL( string: sampleRequestURL )!,
			statusCode: 200,
			httpVersion: nil,
			headerFields: [ "Test" : "Response headers" ]
		)!,
		data: Data()
	),

	createRequest(
		url: sampleRequestURL,
		error: NSError( domain: "Test", code: -999, userInfo: nil )
	),

	createRequest(
		url: sampleRequestURL,
		response: HTTPURLResponse(
			url: URL( string: sampleRequestURL )!,
			statusCode: 400,
			httpVersion: nil,
			headerFields: [ "Test" : "Response headers" ]
		)!,
		error: NSError( domain: "Test", code: -999, userInfo: nil ),
		data: Data()
	),

	createRequest(
		url: sampleRequestURL,
		response: HTTPURLResponse(
			url: URL( string: sampleRequestURL )!,
			statusCode: 200,
			httpVersion: nil,
			headerFields: [ "Test" : "Response headers" ]
		)!,
		data: veryLongAnswer
	)
]


private let veryLongAnswer = """
[
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9504,
	  "channel_id" : "Channel_KHL",
	  "title" : "Нефтехимик - Трактор",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "КХЛ"
	  },
	  "package_id" : "Channel_KHL_575487833",
	  "description" : ""
	},
	"package" : {
	  "id" : "Channel_KHL_575487833",
	  "description" : "Трансляция матчей Континентальной хоккейной лиги - международной лиги, созданной для развития хоккея на территории России и других стран Европы и Азии.",
	  "favorite" : false,
	  "persons" : null,
	  "parental_rating" : 12,
	  "meta" : {
		"channel_id" : "Channel_KHL"
	  },
	  "images" : {
		"poster_2020" : "https://www.yandex.ru/images/img/5b/0d/61ad0ba2815600dcc8a1f67cf4a832fa4a98/poster_2020__iphone-45.jpeg",
		"poster" : "https://www.yandex.ru/images/img/5b/0d/61ad0ba2815600dcc8a1f67cf4a832fa4a98/poster__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/img/5b/0d/61ad0ba2815600dcc8a1f67cf4a832fa4a98/rate_helper__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/img/5b/0d/61ad0ba2815600dcc8a1f67cf4a832fa4a98/secondary_poster__iphone-45.jpeg"
	  },
	  "ends_at" : "2022-01-12T18:20:00Z",
	  "kind" : "Programme",
	  "available_through_landing" : false,
	  "name" : "КХЛ. Прямая трансляция. \"Нефтехимик\" - \"Трактор\"",
	  "starts_at" : "2022-01-12T15:50:00Z"
	},
	"channel" : {
	  "id" : "Channel_KHL",
	  "description" : "Канал для любителей хоккея. Новости континентальной хоккейной лиги. Обзоры матчей, календарь игр КХЛ, результаты, турнирные таблицы. ",
	  "favorite" : false,
	  "sport_kind_ids" : [
		5,
		84
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"color" : "#000000",
		"recording_strategy" : "l2v",
		"channel_number" : 192
	  },
	  "images" : {
		"logo_on_air" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_on_air__iphone-45.png",
		"logo_program" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_program__iphone-45.png",
		"logo_schedule" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_schedule__iphone-45.png",
		"tile" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/tile__iphone-45.jpeg",
		"logo_trp_tv" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_trp_tv__iphone-45.png",
		"secondary_poster" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/secondary_poster__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/tile_history__iphone-45.jpeg",
		"logo_tile" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_tile__iphone-45.png",
		"poster" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/poster_2018__iphone-45.jpeg",
		"logo_poster" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_poster__iphone-45.png",
		"logo_trp_pleer" : "https://www.yandex.ru/images/Channel/11/41/898c784281019f338913f358e562a8c37b93/logo_trp_pleer__iphone-45.png"
	  },
	  "genres" : [
		53
	  ],
	  "kind" : "Channel",
	  "available_through_landing" : false,
	  "name" : "KHL",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9522,
	  "channel_id" : "Channel_Match_TV_HD",
	  "title" : "Тоттенхэм - Челси",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "КУБОК АНГЛИЙСКОЙ ЛИГИ"
	  },
	  "package_id" : "Channel_Match_TV_HD_575168428",
	  "description" : ""
	},
	"package" : {
	  "id" : "Channel_Match_TV_HD_575168428",
	  "description" : "Сражения на внутренней арене сменяются баталиями в рамках Кубка Английской лиги. Один из лидеров Премьер-лиги лондонский \"Челси\" отправляется на ответный полуфинальный матч против \"Тоттенхэма\" не в самом лучшем состоянии. Еще пару туров назад \"синие\" делили первую строчку с \"Манчестер Сити\", а теперь отстают от своих главных конкурентов. И этот фактор может стать ключевым в предстоящем лондонском дерби. Ведь \"шпоры\" делают явный акцент на победе в Кубке и выпустят сильнейший состав против \"Челси\".",
	  "favorite" : false,
	  "persons" : null,
	  "countries" : [
		2584
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"channel_id" : "Channel_Match_TV_HD"
	  },
	  "images" : {
		"poster_2020" : "https://www.yandex.ru/images/img/09/fb/a1a148b616d44c2e34cc37fa30f67ce90f36/poster_2020__iphone-45.jpeg",
		"poster" : "https://www.yandex.ru/images/img/09/fb/a1a148b616d44c2e34cc37fa30f67ce90f36/poster__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/img/09/fb/a1a148b616d44c2e34cc37fa30f67ce90f36/rate_helper__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/img/09/fb/a1a148b616d44c2e34cc37fa30f67ce90f36/secondary_poster__iphone-45.jpeg"
	  },
	  "ends_at" : "2022-01-12T21:45:00Z",
	  "kind" : "Programme",
	  "available_through_landing" : false,
	  "name" : "Футбол. Кубок Английской лиги. 1/2 финала. Прямая трансляция. \"Тоттенхэм\" - \"Челси\"",
	  "starts_at" : "2022-01-12T19:40:00Z"
	},
	"channel" : {
	  "id" : "Channel_Match_TV_HD",
	  "description" : "Матч ТВ – российский федеральный канал. Ежедневно в эфире - захватывающие трансляции главных спортивных событий, развлекательные передачи, посвященные спорту и программы о здоровом образе жизни.",
	  "favorite" : false,
	  "sport_kind_ids" : [
		1,
		72,
		84,
		67
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"color" : "#000000",
		"recording_strategy" : "l2v",
		"channel_number" : 93
	  },
	  "images" : {
		"logo_poster" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_poster__iphone-45.png",
		"poster" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/poster_2018__iphone-45.jpeg",
		"logo_schedule" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_schedule__iphone-45.png",
		"logo_on_air" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_on_air__iphone-45.png",
		"logo_tile" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_tile__iphone-45.png",
		"logo_trp_pleer" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_trp_pleer__iphone-45.png",
		"logo_program" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_program__iphone-45.png",
		"logo_trp_tv" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/logo_trp_tv__iphone-45.png",
		"secondary_poster" : "https://www.yandex.ru/images/Channel/a9/ae/6c16e814b395543cd6fc06225fc59ac7d4c4/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		54,
		123,
		53
	  ],
	  "kind" : "Channel",
	  "available_through_landing" : false,
	  "name" : "МАТЧ! HD",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9460,
	  "title" : "Гарри Поттер 20 лет спустя: Возвращение в Хогвартс",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-30T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-31T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Garri_Potter_20_let_spustya_2021",
	  "description" : "2021, Документальный"
	},
	"package" : {
	  "id" : "Garri_Potter_20_let_spustya_2021",
	  "description" : "Специальный эпизод, приуроченный к 20-летию самой волшебной франшизы в мире. «Гарри Поттер 20 лет спустя: возвращение в Хогвартс» соберет любимых актеров и актрис всех восьми фильмов. Дэниел Рэдклифф, Руперт Гринт и Эмма Уотсон встретятся со своими коллегами и впервые за долгие годы окажутся в стенах Хогвартса. Зрителей ждет не только долгожданное воссоединение главных лиц легендарной саги, но и ранее не публиковавшиеся интервью и редкие архивы. По словам Тома Ашейма, президента Warner Bros, «Гарри Поттер 20 лет спустя: возвращение в Хогвартс» — «это дань уважения всем, кого затронула кинофраншиза, от съемочной группы до преданных поклонников, которые продолжают поддерживать дух Волшебного мира».",
	  "favorite" : false,
	  "countries" : [
		281,
		2525
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-30T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2021-12-31T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Дэниэл Рэдклифф",
		  "Руперт Гринт",
		  "Эмма Уотсон",
		  "Джейсон Айзекс",
		  "Рэйф Файнс",
		  "Хелена Бонем Картер",
		  "Гари Олдман",
		  "Альфред Энок",
		  "Бонни Райт",
		  "Эванна Линч"
		],
		"allow_offline" : false,
		"duration" : 5926,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Эрен Криви",
		  "Джо Перлман",
		  "Джорджо Тести"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/83/ff/342f7681bb581d7c8cffadc55f6cc8aa2c3e/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		8
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Гарри Поттер 20 лет спустя: Возвращение в Хогвартс",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9518,
	  "title" : "Семейка",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-05T13:25:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-10T13:25:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Semeika_2021",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Semeika_2021",
	  "description" : "С нового года – новая жизнь! Решили Сергей и Надя Нестеровы и пошли к психологу. Похоже, это единственный шанс спасти их многолетний брак. Ведь расшатать его в каждой из 17 эпизодов нового сериала старается свекровь Тамара ради спасения своего великовозрастного, но такого доверчивого мальчика, от расчетливого чудовища-жены. Роль психолога исполнил Вадим Демчог, особенно любимый за сериал «Интерны» и по совместительству кандидат психологических наук.",
	  "favorite" : false,
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-24T16:25:00Z",
		  "kind" : "custom",
		  "visible_at" : "2022-01-10T16:25:00Z",
		  "theme" : "dark",
		  "text" : "Новый сериал"
		},
		"directors" : [
		  "Михаил Соловьёв",
		  "Сергей Знаменский"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Борис Дергачёв",
		  "Ольга Дибцева",
		  "Карина Хисматулина",
		  "Мария Корнеева",
		  "Алексей Родионов",
		  "Вадим Демчог",
		  "Татьяна Орлова",
		  "Софья Реснянская"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/c2/5a/449cb8332dfbf7e8db54228e3c0e5833b19c/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Семейка",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9417,
	  "title" : "Последняя дуэль",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-05T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-06T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Poslednyaya_duel_2021",
	  "description" : "2021, Драма, История"
	},
	"package" : {
	  "id" : "Poslednyaya_duel_2021",
	  "description" : "Важен лишь один вопрос, готова ли она поклясться жизнью, что говорит правду. Нормандский рыцарь рвётся защитить честь своей жены, обвинившей соратника мужа в изнасиловании. В конфликт двух мужчин приходится вмешаться королю. Судьбу решит поединок насмерть. И если супруг Маргариты проиграет, её сожгут на костре. За лжесвидетельство. Заживо.",
	  "favorite" : false,
	  "countries" : [
		2215,
		2584
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"gross_usa" : 10853945,
		"gross_russia" : 1961634,
		"directors" : [
		  "Ридли Скотт"
		],
		"world_release_date" : "2021-09-10T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.5,
		  "kinopoisk" : 7.5309999999999997
		},
		"cast" : [
		  "Мэтт Дэймон",
		  "Адам Драйвер",
		  "Джоди Комер",
		  "Харриет Уолтер",
		  "Бен Аффлек",
		  "Алекс Лоутер",
		  "Мартон Чокаш",
		  "Уильям Хьюстон",
		  "Оливер Коттон",
		  "Орельен Лорнье"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 30494876,
		"budget" : 100000000,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-11-18T00:00:00Z",
		"duration" : 8804,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-02-05T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2022-01-06T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/0d/ae/ccba9cd2559531d31ae2946456592078396d/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		10,
		9
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Последняя дуэль",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : null,
	  "id" : 0,
	  "title" : "Сестры",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Рекомендуем Вам"
	  },
	  "package_id" : "Sestry_2021",
	  "description" : "2021, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "Sestry_2021",
	  "description" : "Семейный бизнес — это единственное, что объединяет совершенно разных сестёр: столичную бизнес-леди, витающую в облаках учительницу и парикмахершу, мечтающую о больших деньгах. Героини получают в наследство от отца автосервис и должны не только взять на себя руководство консервативным мужским коллективом, но и договориться друг с другом.",
	  "favorite" : false,
	  "countries" : [
		2401
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-13T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-06T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Илья Силаев"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Ангелина Миримская",
		  "Анна Котова-Дерябина",
		  "Ангелина Стречина",
		  "Антон Филипенко",
		  "Николай Шрайбер",
		  "Янина Студилина",
		  "Александр Обласов",
		  "Артём Ткаченко",
		  "Александр Пташенчук",
		  "Артур Ваха"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11,
		13
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Сестры",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9357,
	  "title" : "Эйфория",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Eiforiya_2019",
	  "description" : "2022, Драма"
	},
	"package" : {
	  "id" : "Eiforiya_2019",
	  "description" : "Продюсерский проект певца Дрейка с любимицей подростков Зендеей в главной роли. «Эйфория» — откровенная молодежная драма, главные герои которой постигают жизнь через наркотики, секс, травмы и социальные медиа. В центре истории — 17-летняя Ру Беннетт (Зендея), вернувшаяся в родной дом после лечения в реабилитационной клинике. Не теряя времени, она опять берется за старые привычки — наркотики и тусовки. Однако появление в городе девушки Джулс (трансгендерная модель Хантер Шэфер) становится для Ру знаком надежды. Созданием «Эйфории» руководил автор «Нации убийц» Сэм Левинсон. ",
	  "favorite" : false,
	  "countries" : [
		200
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-17T00:00:00+03:00",
		  "kind" : "new_season",
		  "visible_at" : "2022-01-10T00:00:00+03:00",
		  "theme" : "dark",
		  "text" : "Новый сезон"
		},
		"directors" : [
		  "Сэм Левинсон",
		  "Пиппа Бьянко",
		  "Августин Фриззелл"
		],
		"ratings" : {
		  "imdb" : 8.4000000000000004,
		  "kinopoisk" : 7.6509999999999998
		},
		"cast" : [
		  "Зендея",
		  "Остин Абрамс",
		  "Мод Апатоу",
		  "Эрик Дэйн",
		  "Алекса Деми",
		  "Джейкоб Элорди",
		  "Ника Уильямс",
		  "Сторм Рейд"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/28/e4/f16b947b7b4b51a345deae8b720c8ed124f5/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Эйфория",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9338,
	  "title" : "Сестры",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-05T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-23T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Sestry_2021",
	  "description" : "2021, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "Sestry_2021",
	  "description" : "Семейный бизнес — это единственное, что объединяет совершенно разных сестёр: столичную бизнес-леди, витающую в облаках учительницу и парикмахершу, мечтающую о больших деньгах. Героини получают в наследство от отца автосервис и должны не только взять на себя руководство консервативным мужским коллективом, но и договориться друг с другом.",
	  "favorite" : false,
	  "countries" : [
		2401
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-13T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-06T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Илья Силаев"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Ангелина Миримская",
		  "Анна Котова-Дерябина",
		  "Ангелина Стречина",
		  "Антон Филипенко",
		  "Николай Шрайбер",
		  "Янина Студилина",
		  "Александр Обласов",
		  "Артём Ткаченко",
		  "Александр Пташенчук",
		  "Артур Ваха"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/15/36/18889b3e0592d5b0a31e48ba5bf8b091e292/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11,
		13
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Сестры",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9358,
	  "title" : "Охотники за привидениями: Наследники",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-03T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-04T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Ohotnkiki_za_privideniyami_Nasledniki_2021",
	  "description" : "2021, Боевик, Комедия, Фантастика"
	},
	"package" : {
	  "id" : "Ohotnkiki_za_privideniyami_Nasledniki_2021",
	  "description" : "Ностальгическое, атмосферное продолжение легендарной истории со множеством приятных сюрпризов для поклонников. Семья селится на старой ферме, полученной в наследство. Пока мама налаживает личную жизнь, дети обнаруживают странное оборудование и сильно затюнингованную тачку. Ту самую, на которой когда-то рассекали знаменитые охотники за привидениями, и любопытство толкает ребят навстречу приключениям.",
	  "favorite" : false,
	  "countries" : [
		2525,
		1687
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"gross_usa" : 117249884,
		"gross_russia" : 3554353,
		"directors" : [
		  "Джейсон Райтман"
		],
		"world_release_date" : "2021-10-08T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.5999999999999996,
		  "kinopoisk" : 7.1239999999999997
		},
		"cast" : [
		  "Кэрри Кун",
		  "Пол Радд",
		  "Финн Вулфхард",
		  "Маккенна Грейс",
		  "Логан Ким",
		  "Селеста О’Коннор",
		  "Билл Мюррей",
		  "Дэн Эйкройд",
		  "Эрни Хадсон",
		  "Энни Поттс"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 173649884,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-12-02T00:00:00Z",
		"duration" : 7146,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-02-03T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2022-01-04T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/1a/d5/d7ac21c7a45ab3dd1ab15ef6b867ba60ec88/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		11,
		4
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Охотники за привидениями: Наследники",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9149,
	  "title" : "Универ: 10 лет спустя",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-29T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-05T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Univer_10_let_spustya_2021",
	  "description" : "2021, Драма, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "Univer_10_let_spustya_2021",
	  "description" : "Любимые герои культового сериала возвращаются в новом сезоне! Прошло десять лет. Майкл, Варя, Антон, Кристина, Маша, Валя и Яна повзрослели и больше не живут в одном блоке общаги, но проблем у них меньше не стало. Они продолжают общаться и поддерживать друг друга в трудных жизненных ситуациях.",
	  "favorite" : false,
	  "countries" : [
		315
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : false,
		"directors" : [
		  "Сергей Черников"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Арарат Кещян",
		  "Станислав Ярушин",
		  "Александр Мартынов",
		  "Екатерина Молоховская",
		  "Настасья Самбурская",
		  "Анна Хилькевич",
		  "Анна Кузина",
		  "Сергей Пиоро",
		  "Сергей Юшкевич",
		  "Вера Островская"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/4e/e1/f3f3f3953528c20603c8169799b614287e23/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11,
		13,
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Универ: 10 лет спустя",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9359,
	  "title" : "Гранит",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-27T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-28T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Granit_2021",
	  "description" : "2021, Боевик"
	},
	"package" : {
	  "id" : "Granit_2021",
	  "description" : "На севере Мозамбика обнаружены крупные месторождения газа. В окрестностях почти сразу появились бандформирования, которые присягнули на верность «Исламскому государству», и теперь держат в страхе мирное население. На место для оказания военной помощи в борьбе с боевиками направлена российская спецгруппа. Бойцы находят в джунглях местного мальчишку – он может указать местоположение врага, однако не спешит этого делать.",
	  "favorite" : false,
	  "countries" : [
		1225
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-27T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2021-12-28T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Олег Чернов",
		  "Игорь Филиппов",
		  "Евгений Терских"
		],
		"allow_offline" : true,
		"duration" : 5828,
		"world_release_date" : "2021-01-01T00:00:00Z",
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Денис Нейманд"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/8e/d1/40c4ece7792c64ada0bf33a65e4a9fa8e60f/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		4
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Гранит",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9159,
	  "title" : "И просто так",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-22T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-09T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "I_prosto_tak_2021",
	  "description" : "2021, Драма, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "I_prosto_tak_2021",
	  "description" : "Сиквел легендарного сериала «Секс в большом городе». События «И просто так» развиваются спустя 20 лет после окончания оригинального шоу. Кэрри, Миранда и Шарлотта прошли большой путь, их дружба все так же крепка, хотя Саманты больше нет рядом. Зато рядом семья, новые люди и карьерные вызовы — например, Брэдшоу теперь записывает собственный подкаст. В сериале мы увидим много старых и любимых персонажей: от мистера Бига (куда ж без него) до Эйдана (сколько было споров о том, почему Кэрри рассталась с ним!). Без свежей крови тоже никуда — важной для сериала героиней станет небинарная комедиантка в исполнении Сары Рамирес.",
	  "favorite" : false,
	  "countries" : [
		1627
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-13T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-06T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Майкл Патрик Кинг",
		  "Ниша Ганатра",
		  "Джиллиан Робеспьер",
		  "Ану Валиа"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Сара Джессика Паркер",
		  "Кристин Дэвис",
		  "Синтия Никсон",
		  "Николь Ари Паркер",
		  "Крис Нот",
		  "Сара Рамирес",
		  "Карен Питтман",
		  "Сарита Чоудри",
		  "Кристофер Нил Джексон",
		  "Алекса Суинтон"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/68/0a/69ab946245e7960b297d6c09673ccfaef0ae/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		13,
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "И просто так",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9234,
	  "title" : "Король Ричард",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-14T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-15T21:00:00Z",
		"theme" : "dark",
		"text" : "Ранняя онлайн премьера"
	  },
	  "package_id" : "Korol_Richard_2021",
	  "description" : "2021, Биография, Драма, Спорт"
	},
	"package" : {
	  "id" : "Korol_Richard_2021",
	  "description" : "Винус Уильямс. Серена Уильямс. Эти имена вписаны золотом в историю большого тенниса. А начался их путь к победам с трущоб Комптона, куда отец перевёз большую семью из благополучного Лонг-Бич. Все для того, чтобы иметь возможность оплачивать тренировки со всемирно известным тренером. Это история непоколебимой веры в своих детей, которым Ричард Уильямс стал не просто отцом и коучем, но и лучшим другом. Блестящая роль Уилла Смита.",
	  "favorite" : false,
	  "countries" : [
		1039
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"gross_usa" : 11378000,
		"gross_russia" : 279211,
		"directors" : [
		  "Рейнальдо Маркус Грин"
		],
		"world_release_date" : "2021-09-02T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.5999999999999996,
		  "kinopoisk" : 7.6360000000000001
		},
		"cast" : [
		  "Уилл Смит",
		  "Онжаню Эллис",
		  "Санийя Сидни",
		  "Деми Синглтон",
		  "Джон Бернтал",
		  "Тони Голдуин",
		  "Микайла Лашэй Бартоломью",
		  "Даниэль Лоусон",
		  "Лайла Кроуфорд",
		  "Эрика Рингор"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 16578000,
		"budget" : 50000000,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-11-18T00:00:00Z",
		"duration" : 8327,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-15T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Триумф Уилла Смита"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/f8/63/13d9b8660b189110390b82dc07c7dc7d40a9/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		3,
		19
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Король Ричард",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9498,
	  "title" : "Бесит",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-18T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-04T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Besit_2022",
	  "description" : "2022, Драма, Комедия, Триллер"
	},
	"package" : {
	  "id" : "Besit_2022",
	  "description" : "Все серии альманаха — самостоятельные истории, снятые разными режиссерами, о странных, раздражающих и даже страшных моментах нашей жизни. Сериал поднимает такие важные темы, как домашнее насилие, чрезмерные родительские амбиции, безумие тик-токеров и их аудитории, требования общества к девушкам и многое другое.",
	  "favorite" : false,
	  "countries" : [
		2565
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-18T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2022-01-04T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый сериал"
		},
		"directors" : [
		  "Василиса Кузьмина",
		  "Илья Аксенов",
		  "Аксинья Гог",
		  "Артём Соловьев"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Максим Лагашкин",
		  "Борис Дергачев",
		  "Глеб Калюжный",
		  "Ольга Кузьмина",
		  "Нонна Гришаева",
		  "Филипп Ершов",
		  "Сергей Лавыгин",
		  "Дарья Баслык",
		  "Иван Ефремов",
		  "Александра Милёшина"
		],
		"has_hd" : false
	  },
	  "year" : 2022,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/78/52/d1694c73a689bf3f11b4d265477fbcb5e43e/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11,
		20,
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Бесит",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8491,
	  "title" : "Трудные подростки",
	  "description" : "2021, Драма, Спорт",
	  "package_id" : "Trudnye_podrostki_2019",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Trudnye_podrostki_2019",
	  "description" : "Известный футболист Антон Ковалёв, отсидевший два года в тюрьме за пьяный дебош в кафе, выходит на свободу. Этим проступком бывший капитан сборной России поставил крест на своей успешной карьере. Репутация «сбитого летчика» не позволяет ему продолжить любимое дело и получить престижную работу. Некогда воспитывавший Антона глава центра трудных подростков Герман предлагает ему вернуться в альма-матер, чтобы подготовить непростых ребят к местной Олимпиаде. От безысходности Ковалев соглашается на предложение, но даже не представляет, насколько сложно будет найти общий язык с ребятами и какое важное место они могут занять в его жизни.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Рустам Ильясов"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 7.3010000000000002
		},
		"cast" : [
		  "Никита Волков",
		  "Александр Лыков",
		  "Григорий Калинин",
		  "Вильма Кутавичюте",
		  "Виталий Андреев",
		  "Глеб Калюжный",
		  "Владимир Гарцунов",
		  "Анастасия Крылова",
		  "Тимофей Елецкий",
		  "Мила Ершова"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/67/74/32093c26041066cbe9353028228b709a8723/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		19
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Трудные подростки",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9437,
	  "title" : "Тихое место 2",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Tihoe_mesto_2_2021",
	  "description" : "2021, Драма, Ужасы, Фантастика"
	},
	"package" : {
	  "id" : "Tihoe_mesto_2_2021",
	  "description" : "Это не просто сиквел. Это вторая часть истории об инопланетном нашествии существ, реагирующих и охотящихся на звук. Развитие характеров, развитие истории. Критики одобряюще кивают, триллер держит в напряжении и даже прибавил в динамике и зрелищности. Дом семьи Эбботт разрушен, им больше негде укрыться. Но радиосигнал из колонии выживших дает героям надежду и мотивацию двинуться в путь.",
	  "favorite" : false,
	  "countries" : [
		2117
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"budget" : 61000000,
		"gross_russia" : 7406725,
		"gross_usa" : 145281659,
		"ratings" : {
		  "imdb" : 7.5,
		  "kinopoisk" : 6.8609999999999998
		},
		"cast" : [
		  "Эмили Блант",
		  "Миллисент Симмондс",
		  "Киллиан Мёрфи",
		  "Ноа Джуп",
		  "Джон Красински",
		  "Джимон Хонсу",
		  "Окьерете Онаодован",
		  "Скут МакНэри",
		  "Захари Голингер",
		  "Блейк ДеЛонг"
		],
		"has_hd" : true,
		"allow_offline" : true,
		"duration" : 5585,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Джон Красински"
		],
		"gross_world" : 257381659
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/26/5e/18efbd51678dce584db38eb6cc97ffabe2f9/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		21,
		22,
		9
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Тихое место 2",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9327,
	  "title" : "Беспринципные",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Besprintsypnye_2020",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Besprintsypnye_2020",
	  "description" : "Богатые тоже попадают в нелепые ситуации. Жители элитного центра Москвы только на вид приличные люди: за кулисами роскоши они постоянно находят на свою голову приключения из-за похоти, лжи и избалованности.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Роман Прыгунов"
		],
		"ratings" : {
		  "imdb" : 6.5,
		  "kinopoisk" : 7.3650000000000002
		},
		"cast" : [
		  "Павел Деревянко",
		  "Оксана Акиньшина",
		  "Павел Табаков",
		  "Аглая Тарасова",
		  "Максим Виторган",
		  "Ингеборга Дапкунайте",
		  "Николай Фоменко",
		  "Кристина Бабушкина",
		  "Юрий Колокольников",
		  "Надежда Михалкова"
		],
		"has_hd" : false
	  },
	  "year" : 2020,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/ca/3a/03f3bac3ec8812b0ea7fa5dacccd6a010c5b/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Беспринципные",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8962,
	  "title" : "Веном 2",
	  "description" : "2021, Боевик, Приключения, Триллер, Фантастика",
	  "package_id" : "Venom_2_2021",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Venom_2_2021",
	  "description" : "Том Харди уже вполне комфортно уживается с инопланетным симбиотом, достигнув уровня дзена родителя непоседы-трехлетки. Его Эдди Брок планирует триумфальное возращение в журналистскую карьеру с интервью, которое не может не вызвать общественный резонанс. Он едет в тюрьму, беседовать с серийным убийцей Касади, источающим злодейское обаяние Вуди Харрельсона. Эта встреча приведет к эпичному противостоянию двух симбиотов.",
	  "favorite" : false,
	  "countries" : [
		2215,
		281,
		903
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"budget" : 110000000,
		"gross_russia" : 31078264,
		"gross_usa" : 184079491,
		"ratings" : {
		  "imdb" : 6.2999999999999998,
		  "kinopoisk" : 6.1079999999999997
		},
		"cast" : [
		  "Том Харди",
		  "Вуди Харрельсон",
		  "Мишель Уильямс",
		  "Наоми Харрис",
		  "Рейд Скотт",
		  "Стивен Грэм",
		  "Пегги Лу",
		  "Сиан Веббер",
		  "Мишель Гринидж",
		  "Роб Боуэн"
		],
		"has_hd" : true,
		"allow_offline" : true,
		"duration" : 5615,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Энди Серкис"
		],
		"gross_world" : 354679491
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/93/b1/944193a73cc55aa7cb20a7fb404820aa9f74/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		4,
		20,
		17
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Веном 2",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9158,
	  "title" : "СОЛДАУТ",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-22T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-08T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "tpr_Soldaut_2021",
	  "description" : "2021, Драма, Комедия, Музыка"
	},
	"package" : {
	  "id" : "tpr_Soldaut_2021",
	  "description" : "Первое российское музыкальное драмеди о молодом рэпере в кризисе, который вместе с командой таких же сложных личностей должен за месяц записать альбом и собрать «солдаут», чтобы обрести свободу от диктатуры лейбла и обеспечить себе будущее.",
	  "favorite" : false,
	  "countries" : [
		708
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"directors" : [
		  "Иван Плечев"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Глеб Калюжный",
		  "Алексей Шевченков",
		  "Александра Дроздова",
		  "Алексей Розин"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/a7/12/757fb3a8fd1b09d1b006e089ac190de4051e/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		11,
		14
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "СОЛДАУТ",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9108,
	  "title" : "Анатомия страсти",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Foxnow_Anatomiya_strasti_2005",
	  "description" : "2021, Драма, Мелодрама"
	},
	"package" : {
	  "id" : "Foxnow_Anatomiya_strasti_2005",
	  "description" : "Молодые врачи госпиталя Грейс в Сиетле - Мередит, Кристина и Алекс - каждый день решают вопросы жизни и смерти и только друг в друге они находят поддержку, дружбу, а иногда и больше.",
	  "favorite" : false,
	  "countries" : [
		200
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"awards" : [
		  {
			"name" : "Золотой глобус, 2006 год",
			"number" : 1
		  },
		  {
			"name" : "Золотой глобус, 2007 год",
			"number" : 1
		  },
		  {
			"name" : "Премия Гильдии актеров, 2006 год",
			"number" : 1
		  },
		  {
			"name" : "Премия Гильдии актеров, 2007 год",
			"number" : 2
		  },
		  {
			"name" : "Эмми, 2007 год",
			"number" : 1
		  },
		  {
			"name" : "Эмми, 2011 год",
			"number" : 1
		  }
		],
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-16T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-09T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"ratings" : {
		  "imdb" : 7.5999999999999996,
		  "kinopoisk" : 8.1460000000000008
		},
		"cast" : [
		  "Джастин Чэмберс",
		  "Эллен Помпео",
		  "Шандра Уилсон",
		  "Джеймс Пикенс мл.",
		  "Кевин МакКидд",
		  "Патрик Демпси",
		  "Сара Рамирес",
		  "Bokhee An",
		  "Джесси Уильямс",
		  "Джессика Кэпшоу"
		],
		"allow_offline" : true,
		"directors" : [
		  "Роб Корн",
		  "Кевин МакКидд",
		  "Дебби Аллен"
		]
	  },
	  "year" : 2005,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/5f/a1/98d880156dd27576bf399848dd50e9f7e77d/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		13
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Анатомия страсти",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9362,
	  "title" : "Множественные святые Ньюарка",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-28T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-29T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Mnozhestvennye_svyatye_New_Arka_2021",
	  "description" : "2021, Драма, Криминал"
	},
	"package" : {
	  "id" : "Mnozhestvennye_svyatye_New_Arka_2021",
	  "description" : "Как Тони Сопрано стал Тони Сопрано. Гангстерская история, начало. События 1960-х, когда в Ньюарке штат Нью-Джерси начались вооруженные конфликты между итальянской мафией, считавшей этот город своим, и афроамериканцами, которых становилось всё больше. Противостояние семей и мировоззрений от создателей культового сериала.",
	  "favorite" : false,
	  "countries" : [
		2608
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-28T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-29T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Приквел Сопрано"
		},
		"gross_usa" : 8220603,
		"ratings" : {
		  "imdb" : 6.2999999999999998,
		  "kinopoisk" : 5.9180000000000001
		},
		"cast" : [
		  "Алессандро Нивола",
		  "Майкл Гандольфини",
		  "Лесли Одом мл.",
		  "Вера Фармига",
		  "Джон Бернтал",
		  "Кори Столл",
		  "Рэй Лиотта",
		  "Микела Де Росси",
		  "Билли Магнуссен",
		  "Джон Магаро"
		],
		"allow_offline" : true,
		"duration" : 6922,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Алан Тейлор"
		],
		"gross_world" : 12720603
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/c5/15/62349ce35dc68c9a254b15abe397a0a09789/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		12,
		9
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Множественные святые Ньюарка",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9363,
	  "title" : "Праведные Джемстоуны",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Pravednye_Dzhemstouny_2019",
	  "description" : "2022, Комедия"
	},
	"package" : {
	  "id" : "Pravednye_Dzhemstouny_2019",
	  "description" : "Звезда популярных шоу «Завучи» и «На дне» Дэнни МакБрайд возвращается на HBO с комедией про телеведущих-проповедников. Да еще и в компании гениального Джона Гудмана («Большой Лебовски»)! Отец, сын, внук — три поколения Джемстоунов — путешествуют по миру и несут своим прихожанам слово божье. Однако духовное и материальное для них неразрывны: образ жизни семьи сильно противоречит проповедям о благочестии. Мощный конфликт в основе сюжета, острый юмор, блистательная актерская игра — кажется, это новая удача МакБрайда.",
	  "favorite" : false,
	  "countries" : [
		200
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-17T00:00:00+03:00",
		  "kind" : "new_season",
		  "visible_at" : "2022-01-10T00:00:00+03:00",
		  "theme" : "dark",
		  "text" : "Новый сезон"
		},
		"directors" : [
		  "Дэнни Макбрайд"
		],
		"ratings" : {
		  "imdb" : 8,
		  "kinopoisk" : 6.9470000000000001
		},
		"cast" : [
		  "Дэнни Макбрайд",
		  "Джон Гудман",
		  "Эди Паттерсон",
		  "Адам Дивайн",
		  "Кэссиди Фриман",
		  "Тони Кавалеро",
		  "Тим Балц",
		  "Келтон ДюМонт",
		  "Скайлер Гизондо",
		  "Трой Хоган"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/03/79/4af8efdd64b0f1e2a6de1b6ebdd44f01f260/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Праведные Джемстоуны",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 9364,
	  "title" : "Вампиры средней полосы",
	  "description" : "2021, Детектив, Комедия",
	  "package_id" : "Vampiry_srednei_polosy_2020",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Vampiry_srednei_polosy_2020",
	  "description" : "Смоленск от любого другого города средней полосы отличает лишь одно: здесь живут вампиры! Тихо, по закону и не убивают людей. Но кто-то этот закон нарушил — в лесу находят обескровленные тела. Мирная жизнь необычной семьи оказывается под угрозой.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Антон Маслов"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Юрий Стоянов",
		  "Татьяна Догилева",
		  "Екатерина Кузнецова",
		  "Артем Ткаченко",
		  "Ольга Медынич",
		  "Михаил Гаврилов-Третьяков",
		  "Дмитрий Чеботарёв",
		  "Глеб Калюжный",
		  "Дмитрий Лысенков",
		  "Александр Устюгов"
		],
		"has_hd" : false
	  },
	  "year" : 2020,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/4e/2e/1ad4a3788440df20c276180d9c084f3952cd/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		7,
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Вампиры средней полосы",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9365,
	  "title" : "Полночь на злаковом поле",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новое в подписке"
	  },
	  "package_id" : "Polnoch_na_zlakovom_pole_2021",
	  "description" : "Еще 3000+ фильмов\r\n"
	},
	"package" : {
	  "id" : "Polnoch_na_zlakovom_pole_2021",
	  "description" : "Он мучает кого-то прямо сейчас. Настоящий серийный убийца, похищающий жертв на стоянках для грузовиков. Расследованием занимается ФБР, но стандартными мерами здесь явно не обойтись, и агент Ребекка Ломбарди вызывается стать наживкой. Её напарнику идея не нравится, но события развиваются настолько стремительно, что на раздумья не остается времени. План был выманить маньяка – и он не сработал.",
	  "favorite" : false,
	  "countries" : [
		2525
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"gross_russia" : 64058,
		"has_hd" : true,
		"ratings" : {
		  "imdb" : 4.4000000000000004,
		  "kinopoisk" : 4.9089999999999998
		},
		"cast" : [
		  "Меган Фокс",
		  "Эмиль Хирш",
		  "Брюс Уиллис",
		  "Лукас Хаас",
		  "Кэйтлин Кармайкл",
		  "Олив Элиз Аберкромби",
		  "Джейсон Трэвик",
		  "Лидия Халл",
		  "Уэлкер Уайт",
		  "Алек Монополи"
		],
		"allow_offline" : true,
		"duration" : 5685,
		"world_release_date" : "2021-06-13T00:00:00Z",
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Рэндолл Эмметт"
		],
		"gross_world" : 74973,
		"russian_release_date" : "2021-08-05T00:00:00Z"
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/a9/97/bbbde6e38cd7b2f7abad7cc01afa8bdb150e/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		20,
		7,
		12
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Полночь на злаковом поле",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 8765,
	  "title" : "Родком",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Rodkom_2020",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Rodkom_2020",
	  "description" : "Сергей Шмелев — суровый строитель и с недавнего времени одинокий папа. Чтобы стать первоклассным отцом для своего сына Вани, Сергей готов пойти на все… даже вступить в родительский комитет, возглавляемый его школьной «подругой» Светой Сурковой. Но ее ненависть к Сергею сильнее, чем сострадание и желание помочь, ведь когда-то в молодости он изрядно потрепал ей нервы.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"allow_offline" : false,
		"directors" : [
		  "Мария Кравченко"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 7.7889999999999997
		},
		"cast" : [
		  "Виктор Хориняк",
		  "Ольга Лерман",
		  "Екатерина Кузнецова",
		  "Анастасия Имамова",
		  "Алина Алексеева",
		  "Галина Безрук",
		  "Павел Ворожцов",
		  "Вероника Тимофеева",
		  "Василий Слинкин",
		  "Матвей Семёнов"
		],
		"has_hd" : false
	  },
	  "year" : 2020,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/3a/ca/02406c075915ddd1a77195cdc5bba253a783/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Родком",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8774,
	  "title" : "Полярный",
	  "description" : "2021, Комедия",
	  "package_id" : "tpr_Polyarnyj_2019",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "tpr_Polyarnyj_2019",
	  "description" : "Виктор Громов, некогда легенда криминальной Москвы по кличке Мясник, давно отошел от дел и коротает дни на загородной ферме. Но в один прекрасный день на ферме появляются его бывшие коллеги по опасному бизнесу и ставят перед фактом – Витя должен передержать на своем банковском счете воровской общак. Он вынужден согласиться. Но в тот самый день, когда Витя должен вернуть деньги, он получает удар по голове и начисто забывает пароль от банковского счета. Спасаясь бегством от бывших подельников, Витя оказывается за тысячи километров от Москвы. В маленьком северном городке под названием Полярный-17…",
	  "favorite" : false,
	  "countries" : [
		797
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"directors" : [
		  "Михаил Старчак",
		  "Константин Статский"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 6.8200000000000003
		},
		"cast" : [
		  "Михаил Пореченков",
		  "Иван Охлобыстин",
		  "Катерина Шпица",
		  "Карина Зверева",
		  "Жаргал Бадмацыренов",
		  "Филипп Дьячков",
		  "Антон Богданов",
		  "Игорь Жижикин",
		  "Ян Цапник",
		  "Владимир Епифанцев"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/bf/e2/33ebd6f200f3671862cda582ef246558414c/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Полярный",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9418,
	  "title" : "Французский вестник. Приложение к газете «Либерти. Канзас ивнинг сан»",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-05T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-06T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Frantsuzskii_vestnik_Prilozhenie_k_gazete_Liberti_2021",
	  "description" : "2021, Драма, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "Frantsuzskii_vestnik_Prilozhenie_k_gazete_Liberti_2021",
	  "description" : "Новый шедевр от мастера маниакально-кинематографичных историй и неповторимого, узнаваемого стиля с шикарным кастом даже для мимолетных ролей. Три основных сюжета. Заключенный вдохновляется надзирательницей и пишет картину, которую затем отказывается продавать. Студент пытается раскачать революционный движ и отношения с женщиной существенно старше его. Полицейский повар сосредоточен на высокой кухне, а все остальные – на похищенном сыне комиссара.",
	  "favorite" : false,
	  "countries" : [
		587,
		774
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"gross_usa" : 15564909,
		"gross_russia" : 1602658,
		"directors" : [
		  "Уэс Андерсон"
		],
		"world_release_date" : "2021-07-12T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.5,
		  "kinopoisk" : 7.8140000000000001
		},
		"cast" : [
		  "Джеффри Райт",
		  "Эдриан Броуди",
		  "Тильда Суинтон",
		  "Фрэнсис МакДорманд",
		  "Тимоти Шаламе",
		  "Билл Мюррей",
		  "Лина Кудри",
		  "Анжелика Хьюстон",
		  "Бенисио Дель Торо",
		  "Оуэн Уилсон"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 40399531,
		"budget" : 25000000,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-11-18T00:00:00Z",
		"duration" : 6205,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-02-05T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2022-01-06T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/07/9c/658d430bdf6f1a0e80785bab7b8caeb1f5eb/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		13,
		11
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Французский вестник. Приложение к газете «Либерти. Канзас ивнинг сан»",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9376,
	  "title" : "Мой восьмой",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-04T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-07T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Moy_vosmoy_2021",
	  "description" : "2021, Драма, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "Moy_vosmoy_2021",
	  "description" : "Всё начинается с неожиданной встречи: обаятельный инженер Юхо знакомится с Марией в ресторане отеля. Пара прекрасно проводит время, а позже герой с удивлением выясняет, что у его новой знакомой 7 любовников — по одному на каждый день недели. И одно место как раз вакантно: мистер Понедельник соврал, нарушив тем самым контракт, который подписывает каждый из мужчин. Но Юхо мало одного дня, и у него есть план.",
	  "favorite" : false,
	  "countries" : [
		457
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-07T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Теэму Никки"
		],
		"ratings" : {
		  "imdb" : 7.2000000000000002,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Пекка Странг",
		  "Криста Косонен",
		  "Олли Рахконен",
		  "Матти Оннисмаа",
		  "Яри Вирман",
		  "Амир Эскандари",
		  "Jouko Puolanto",
		  "Йунас Саартамо",
		  "Вилле Тиихонен",
		  "Элиас Вестерберг"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/f7/98/741d8eb01314b428b034af99e58922872102/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		13,
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Мой восьмой",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9484,
	  "title" : "СТАС",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-15T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-01T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "tpr_STAS_2022",
	  "description" : "2022, Комедия"
	},
	"package" : {
	  "id" : "tpr_STAS_2022",
	  "description" : "Первый стендап-сериал, в котором Стас Старовойтов, попадая в ту или иную жизненную ситуацию, будет комментировать ее в своем стендап-монологе. Он затронет такие волнующие всех взрослых проблемы, как воспитание детей, ментальное здоровье и отношения внутри семьи.",
	  "favorite" : false,
	  "countries" : [
		2303
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : false,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-15T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2022-01-01T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый сериал"
		},
		"directors" : [
		  "Андрей Элинсон"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Станислав Старовойтов",
		  "Полина Долиндо",
		  "Ева Смирнова"
		],
		"has_hd" : false
	  },
	  "year" : 2022,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/ba/24/6c585504f3e9270b7a38dde0021e4fd151d9/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "СТАС",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 8839,
	  "title" : "Декстер: Новая кровь",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-16T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-09T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый эпизод"
	  },
	  "package_id" : "Dekster_Novaya_krov_2021",
	  "description" : "2021, Драма"
	},
	"package" : {
	  "id" : "Dekster_Novaya_krov_2021",
	  "description" : "Главный тв-маньяк возвращается. «Декстер: новая кровь» — продолжение кровавых приключений знаменитого персонажа Майкла Си Холла. Теперь Декстер Морган живет под вымышленным именем в северной части штата Нью-Йорк. Он пытается забыть свое темное прошлое, но в городе происходит ряд загадочных похищений и убийств. Эти мрачные события заставляют Декстера снова вернуться к своему невеселому ремеслу. «Декстер: новая кровь» покажет подросшего сына главного героя, также в сериал вернется его сестра в исполнении Дженнифер Карпентер.",
	  "favorite" : false,
	  "countries" : [
		1333
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2022-01-09T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Маркос Сига"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Майкл С. Холл",
		  "Джек Элкотт",
		  "Джулия Джонс",
		  "Джонни Секвойя",
		  "Алано Миллер",
		  "Дженнифер Карпентер",
		  "Дэвид Магидофф",
		  "Клэнси Браун",
		  "Майкл Сирил Крейтон",
		  "Кэти Салливан"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/a3/08/f33e708a123ef49b788a60fc28d9d766d4e6/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Декстер: Новая кровь",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 8733,
	  "title" : "Дюна",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Цена снижена"
	  },
	  "package_id" : "Dune_2021",
	  "description" : "2021, Боевик, Драма, Приключения, Фантастика"
	},
	"package" : {
	  "id" : "Dune_2021",
	  "description" : "Новейшее амбициозное кинопереосмысление одного из самых известных научно-фантастических романов XX века. Борьба за планету Арракис, в песках которой добывают чуть ли не единственную ценность в измученной войнами Вселенной, лежит в основе межгалактических конфликтов. На этом фоне складывается судьба наследника знаменитого дома Атрейдесов, вынужденного податься в бега из-за интриг врагов.",
	  "favorite" : false,
	  "countries" : [
		657,
		697,
		1474
	  ],
	  "parental_rating" : 12,
	  "meta" : {
		"budget" : 165000000,
		"gross_russia" : 7769435,
		"has_hd" : true,
		"ratings" : {
		  "imdb" : 8.5,
		  "kinopoisk" : 8.0280000000000005
		},
		"cast" : [
		  "Тимоти Шаламе",
		  "Ребекка Фергюсон",
		  "Оскар Айзек",
		  "Джош Бролин",
		  "Джейсон Момоа",
		  "Зендея",
		  "Стеллан Скарсгард",
		  "Хавьер Бардем",
		  "Дэйв Батиста",
		  "Шарлотта Рэмплинг"
		],
		"allow_offline" : true,
		"duration" : 8946,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Дени Вильнёв"
		],
		"gross_world" : 37900000
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/01/74/12936eff28427039cc8bf392e8a435a81e19/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		9,
		17,
		4
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Дюна",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9107,
	  "title" : "СеняФедя",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Senyafedya_2018",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Senyafedya_2018",
	  "description" : "Сеня и Федя решают открыть собственный бизнес — закусочную на колёсах. Совместная работа не ладится с первого дня, но разойтись друзья не могут, ведь ничто так не объединяет людей, как совместный кредит. Попав в мир деловых отношений, парни сталкиваются не только с проблемой поиска компромиссов, но и с крупной сетью фудтраков, стремящихся вытеснить с улиц всех конкурентов. На фоне борьбы с акулами гастрономического бизнеса друзья не заметят, как поменяются ролями на личной «кухне»: семьянин Сеня попробует на вкус холостяцкую жизнь, а бабник Федя отправится на поиски тихой семейной гавани.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Юрий Владовский"
		],
		"ratings" : {
		  "imdb" : 5.4000000000000004,
		  "kinopoisk" : 5.9029999999999996
		},
		"cast" : [
		  "Сергей Лавыгин",
		  "Михаил Тарабукин",
		  "Анна Бегунова",
		  "Ирина Аугшкап",
		  "Леся Кудряшова",
		  "Кристина Юдичева",
		  "Арина Полонская",
		  "Алексей Старченко",
		  "Андрей Трушин",
		  "Галина Коньшина"
		],
		"has_hd" : false
	  },
	  "year" : 2018,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/c9/16/b4c2ff32347dcd9596b0abd758ec39e010ab/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "СеняФедя",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9366,
	  "title" : "День мертвецов",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-13T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-30T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Den_mertvetsov_2021",
	  "description" : "2021, Боевик, Ужасы"
	},
	"package" : {
	  "id" : "Den_mertvetsov_2021",
	  "description" : "Накануне выборов в небольшом канадском городке случился адский форс-мажор. Добывающая компания так активно разрабатывала местные шахты, что потревожила мертвецов. Улицы города заполонили голодные зомби. События развиваются настолько стремительно, что времени на раздумья не остается, нужно просто попытаться выжить. В идеале, сохранив мозги в черепной коробке.",
	  "favorite" : false,
	  "countries" : [
		361
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-13T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-30T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый сериал"
		},
		"ratings" : {
		  "imdb" : 4.5,
		  "kinopoisk" : 5.0599999999999996
		},
		"cast" : [
		  "Кинэн Трэйси",
		  "Дэниэл Доэни",
		  "Натали Малайка",
		  "Миранда Фригон",
		  "Деян Лойола",
		  "Морган Холмстром",
		  "Кристи Доун Динсмор",
		  "Майк Допуд",
		  "Гари Чок",
		  "Кевин О’Грэйди"
		],
		"allow_offline" : true,
		"world_release_date" : "2021-10-15T00:00:00Z",
		"directors" : [
		  "Стивен Костански",
		  "Джем Гаррард",
		  "Жаки Гулд"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/4d/42/5ce08f4fd2d37a7dace7c65be1040c75e713/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		21,
		4
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "День мертвецов",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9450,
	  "title" : "Королевская игра",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-07T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-08T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Korolevskaya_igra_2021",
	  "description" : "2021, Драма, Триллер"
	},
	"package" : {
	  "id" : "Korolevskaya_igra_2021",
	  "description" : "Вена, 1938 год. Юрист Йозеф Барток вместе с женой собирается покинуть оккупированную нацистами Австрию, но его арестовывает гестапо. От Бартока требуют выдать конфиденциальную информацию о клиентах, а после отказа помещают в одиночное заключение и полностью лишают связи с внешним миром. Но однажды Йозефу удается украсть у своих тюремщиков книгу о шахматах. Она становится для него одновременно и спасением, и опасным наваждением…",
	  "favorite" : false,
	  "countries" : [
		1965,
		1655
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"gross_russia" : 49545,
		"directors" : [
		  "Филипп Штёльцль"
		],
		"world_release_date" : "2021-08-29T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.2000000000000002,
		  "kinopoisk" : 6.9569999999999999
		},
		"cast" : [
		  "Оливер Мазуччи",
		  "Альбрехт Шух",
		  "Биргит Минихмайр",
		  "Рольф Лассгор",
		  "Андреас Луст",
		  "Самуэль Финци",
		  "Лукас Мико",
		  "Клеменс Берндорфф",
		  "Герхард Фледль",
		  "Луиза-Селин Гаффрон"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 847928,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-10-14T00:00:00Z",
		"duration" : 6442,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-02-07T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2022-01-08T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/52/ba/229d014f534bd3294f659b382d89d99ed695/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		20
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Королевская игра",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9067,
	  "title" : "КрисТина",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-29T05:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-02T05:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Kristina_2021",
	  "description" : "2021, Драма, Триллер"
	},
	"package" : {
	  "id" : "Kristina_2021",
	  "description" : "Крис работает продавцом в зоомагазине на окраине города, хотя когда-то мечтала стать ветеринаром. Девушка отказывается брать судьбу в свои руки и доверяет любой выбор монетке, подаренной отцом. Она строит большие планы на отпуск с парнем, но в первый же день всё летит к чертям. Крис встречает бывшего, а рядом с ним неожиданно видит другую версию себя — уверенную и успешную Тину, чья жизнь сложилась совсем иначе. Кто же из девушек — настоящая Кристина?",
	  "favorite" : false,
	  "countries" : [
		581
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-12T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-05T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Владимир Ракша"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Юлия Хлынина",
		  "Петр Скворцов",
		  "Антон Филипенко",
		  "Андрей Ургант",
		  "Евгения Дмитриева",
		  "Софья Донианц",
		  "Анатолий Котенёв",
		  "Вера Островская",
		  "Илья Синцов",
		  "Максим Радугин"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/d1/95/72875839dc7f772cf98f15dac83dcccc721c/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		20,
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "КрисТина",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9499,
	  "title" : "Чиновник",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-02T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-03T18:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "tpr_Chinovnik_2021",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "tpr_Chinovnik_2021",
	  "description" : "Абсурдистская комедия о коррупции с Андреем Бурковским и Павлом Майковым. Владелец строительной компании Андрей оказывается на грани банкротства. В панике он обращается к своему старому знакомому — городскому чиновнику Максиму Эдуардовичу — и просит помочь ему выиграть тендер. Предприниматель решает устроить званый ужин и приглашает политика к себе в загородный дом. Все готово к приезду «дорогого» гостя, но едва он переступает порог, как весь план летит под откос.",
	  "favorite" : false,
	  "countries" : [
		797
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"gross_russia" : 2352,
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-02-02T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2022-01-03T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 5.4960000000000004
		},
		"cast" : [
		  "Павел Майков",
		  "Андрей Бурковский",
		  "Любовь Толкалина",
		  "Александр Головин",
		  "Александра Киселева",
		  "Тереза Диуро",
		  "Зоя Бербер",
		  "Любовь Аксенова"
		],
		"allow_offline" : false,
		"duration" : 4581,
		"directors" : [
		  "Владимир Моташнёв"
		],
		"russian_release_date" : "2021-12-09T00:00:00Z"
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/67/e4/c2eeba9b05b391aa537e9f2bb7109d43e928/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Чиновник",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9112,
	  "title" : "Пришельцы из прошлого",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Prishelcy_iz_proshlogo_2019",
	  "description" : "2021, Детектив, Драма, Фантастика"
	},
	"package" : {
	  "id" : "Prishelcy_iz_proshlogo_2019",
	  "description" : "Первый оригинальный проект из Норвегии для HBO Nordic. В мире творится что-то странное: из прошлого появляются гости и нарушают привычный ход вещей. Пришельцы прибывают из разных эпох — палеолита, каменного века, XIX века — и упорно не хотят приспосабливаться к новым технологиям. Спустя несколько лет трудного сосуществования викинг Альфхильдр поступает на службу в полицию и предпринимает попытку выяснить, что стало причиной странного сбоя во времени и пространстве. Режиссером сериала «Пришельцы из прошлого» выступил Йенс Лиен, автор блистательной трагикомедии «Неуместный человек».",
	  "favorite" : false,
	  "countries" : [
		150
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Йенс Лиен"
		],
		"ratings" : {
		  "imdb" : 7.7999999999999998,
		  "kinopoisk" : 7.3150000000000004
		},
		"cast" : [
		  "Николай Клеве Брок",
		  "Аугуста Эва Эрлендсдоуттир",
		  "Криста Косонен",
		  "Стиг Р. Амдам",
		  "Ragnhild Gudbrandsen",
		  "Lavrans Haga",
		  "Элли Харбоа",
		  "Nader Khademi",
		  "Еппе Бек Леурсен",
		  "Ингунн Беате Ёйен"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/05/54/7d64e2b942fcd66d726b284e2b95832354bc/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		9,
		7
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Пришельцы из прошлого",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9231,
	  "title" : "Неисправимый Рон",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-15T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-16T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Neispravimyi_Ron_2021",
	  "description" : "2021, Для детей, Комедия, Мультфильм, Приключения, Семейный, Фантастика"
	},
	"package" : {
	  "id" : "Neispravimyi_Ron_2021",
	  "description" : "Будущее. Все подростки увлечены новым гаджетом Би-ботом, без которого жизнь не жизнь. Уж надо понимать. И папа Барни понимает. Пусть не в сам день рожденья, но он дарит сыну желанного робота. С седьмого неба от счастья Барни спустится быстро: би-бот Рон будет неисправимо глючить. Мультфильм об истинной ценности дружбы вопреки самым высоким технологиям.",
	  "favorite" : false,
	  "countries" : [
		2019,
		411,
		1981
	  ],
	  "parental_rating" : 6,
	  "meta" : {
		"gross_usa" : 22152788,
		"gross_russia" : 2844346,
		"directors" : [
		  "Сара Смит",
		  "Жан-Филипп Вине",
		  "Октавио Е. Родригес"
		],
		"world_release_date" : "2021-06-16T00:00:00Z",
		"ratings" : {
		  "imdb" : 7.2000000000000002,
		  "kinopoisk" : 7.5940000000000003
		},
		"cast" : [
		  "Джек Дилан Грейзер",
		  "Зак Галифианакис",
		  "Эд Хелмс",
		  "Оливия Колман",
		  "Роб Делани",
		  "Джастис Смит",
		  "Кайли Кэнтралл",
		  "Рикардо Уртадо",
		  "Каллен МакКарти",
		  "Ава Морс"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 57652788,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-10-21T00:00:00Z",
		"duration" : 6156,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-15T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-16T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Милый, но глючный"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/bd/a7/0a92b71a2873bc18a77caa47e082ef6efb80/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		15,
		22,
		11,
		17,
		18,
		1
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Неисправимый Рон",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9061,
	  "title" : "Ваша честь",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-22T09:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-16T09:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Vasha_chest_2021",
	  "description" : "2021, Драма, Криминал, Триллер"
	},
	"package" : {
	  "id" : "Vasha_chest_2021",
	  "description" : "Изначально сериал про принципиального судью, который прячет сына от вендетты, придумали в Израиле. Потом эффектно адаптировали в Штатах. И вот, наконец, можно сопереживать героям в отечественных реалиях. Герой Олега Меньшикова был готов отдать оступившегося сына в руки правосудия ровно до того момента, когда узнал, кому именно он перешел дорогу.",
	  "favorite" : false,
	  "countries" : [
		1813
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-13T09:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-06T09:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Олег Меньшиков",
		  "Владислав Миллер",
		  "Ольга Тумайкина",
		  "Дарья Урсуляк",
		  "Ростислав Бершауэр",
		  "Дмитрий Тополь",
		  "Лира Айларова",
		  "Сослан Фидаров",
		  "Кристина Кучеренко",
		  "Алексей Гаврилов"
		],
		"allow_offline" : true,
		"directors" : [
		  "Константин Статский"
		],
		"russian_release_date" : "2021-12-02T00:00:00Z"
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/bf/66/81ec55d6047d2f7232bf7be3e503790ebf17/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		20,
		9,
		12
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Ваша честь",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9438,
	  "title" : "Щенячий патруль в кино",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-05T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-23T18:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Schenyachii_patrul_v_kino_2021",
	  "description" : "2021, Для детей, Комедия, Мультфильм, Приключения, Семейный, Фэнтези"
	},
	"package" : {
	  "id" : "Schenyachii_patrul_v_kino_2021",
	  "description" : "Щенячий патруль в кино и, конечно, у нас! Город Приключений в опасности – хвастливый злодей Хамдингер стал мэром и теперь будет наводить там свои порядки… если только ему не помешают настоящие герои. А такие есть! Отважные щенки готовы отстоять права четвероногих собратьев, которых градоначальник терпеть не может. Вместе с проворной таксой Либерти команда Щенячьего патруля снова в деле!",
	  "favorite" : false,
	  "countries" : [
		2506,
		452
	  ],
	  "parental_rating" : 6,
	  "meta" : {
		"gross_russia" : 2225025,
		"has_hd" : true,
		"gross_usa" : 40127371,
		"ratings" : {
		  "imdb" : 6.2000000000000002,
		  "kinopoisk" : 6.7469999999999999
		},
		"cast" : [
		  "Иэн Армитедж",
		  "Марсаи Мартин",
		  "Рон Пардо",
		  "Яра Шахиди",
		  "Ким Кардашьян Уэст",
		  "Рэндолл Пак",
		  "Дэкс Шепард",
		  "Тайлер Перри",
		  "Джимми Киммел",
		  "Уилл Брисбин"
		],
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-22T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2021-12-23T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		},
		"duration" : 4953,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Кэллан Брункер"
		],
		"gross_world" : 130127371
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/d3/b7/756490a532a2e355f366f7adc968210dac0f/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		15,
		23,
		11,
		17,
		18,
		1
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Щенячий патруль в кино",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9160,
	  "title" : "Евгенич",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-22T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-08T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "tpr_Evgenich_2021",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "tpr_Evgenich_2021",
	  "description" : "В комедийном сериале солист группы «Руки Вверх» Сергей Жуков напишет новые хиты Бузовой, Милохину, Лолите, Билану и другим российским звездам! Легендарный музыкальный продюсер Евгенич создал многие хиты 90-х, под которые танцевали стадионы и первые лица страны. Но после скандального случая на «Песне года» он пропал с радаров шоу-бизнеса. Многие считают, что на его карьере давно поставлена жирная точка, но спустя 30 лет он возвращается.",
	  "favorite" : false,
	  "countries" : [
		2107
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : false,
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Сергей Жуков"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/5c/21/65b1333e5a2bb921f957f488095822e0be1c/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Евгенич",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9370,
	  "title" : "Доктор Лиза",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новое в подписке"
	  },
	  "package_id" : "Doktor_Liza_2020",
	  "description" : "Еще 3000+ фильмов\r\n"
	},
	"package" : {
	  "id" : "Doktor_Liza_2020",
	  "description" : "Сколько жизней она могла еще спасти, если бы не та трагедия над Черным морем. Человек огромного сердца и неисчерпаемого сострадания – Елизавета Глинка в исполнении другого ангела благотворительности – Чулпан Хаматовой. Художественный фильм про один день из жизни самоотверженного доктора, забывающего о себе и принятых правилах ради помощи тем, у кого не осталось другой надежды.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"awards" : [
		  {
			"name" : "Золотой орел, 2021 год",
			"number" : 1
		  },
		  {
			"name" : "Кинотавр, 2020 год",
			"number" : 1
		  }
		],
		"budget" : 72000000,
		"gross_russia" : 301702,
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 8.0999999999999996
		},
		"cast" : [
		  "Чулпан Хаматова",
		  "Анджей Хыра",
		  "Константин Хабенский",
		  "Андрей Бурковский",
		  "Евгений Писарев",
		  "Алексей Агранович",
		  "Сергей Сосновский",
		  "Татьяна Догилева",
		  "Елена Коренева",
		  "Тимофей Трибунцев"
		],
		"has_hd" : true,
		"allow_offline" : true,
		"duration" : 7202,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Оксана Карас"
		],
		"gross_world" : 301186
	  },
	  "year" : 2020,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/e5/d8/32104eddae8db49507848566e2f445648223/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		3
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Доктор Лиза",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8937,
	  "title" : "Вне себя",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Vne_sebya_2021",
	  "description" : "2021, Комедия, Триллер"
	},
	"package" : {
	  "id" : "Vne_sebya_2021",
	  "description" : "Комедийный триллер с Евгением Стычкиным, Еленой Лядовой и Евгением Цыгановым. Успешный финансовый аналитик Дмитрий страдает редкой формой психического расстройства — он не помнит несколько лет своей жизни, но его преследуют фантомы людей, в смерти которых он косвенно себя винит. Дмитрий продолжает общаться с призраками как с реальными знакомыми, но они мешают ему наладить личную жизнь, а главное, получить опеку над пятилетним сыном. Дмитрий обращается к психотерапевту, чтобы разобраться со своим недугом, но попытки распутать события прошлых лет приводят его к старым врагам и не самым приятным воспоминаниям.",
	  "favorite" : false,
	  "countries" : [
		2303
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"is_final" : false,
		"directors" : [
		  "Клим Козинский"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Евгений Стычкин",
		  "Елена Лядова",
		  "Евгений Цыганов",
		  "Анна Котова-Дерябина"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/57/fc/8cea562c9633eac42ac455cf009590aebc57/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		20,
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Вне себя",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9486,
	  "title" : "Турист",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-15T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-01T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Turist_2022",
	  "description" : "2022, Детектив, Драма, Триллер"
	},
	"package" : {
	  "id" : "Turist_2022",
	  "description" : "Сериал с Джейми Дорнаном («50 оттенков серого») и Даниель Макдональд («Леди Берд»). Главный герой драмы «Турист» — британец, преследуемый большим грузовиком в австралийской глуши. Погоня буквально отнимает у него все: вскоре мужчина просыпается в больнице без памяти. Герой не может вспомнить, что с ним произошло, как его сюда занесло, кто он вообще такой. Теперь главная задача британца — восстановить цепь событий и вернуть себе свою жизнь обратно. Но сделать это будет крайне непросто несмотря на то, что призраки прошлого, кажется, где-то рядом.",
	  "favorite" : false,
	  "countries" : [
		772,
		1752,
		1529
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#F7791C",
		  "visible_until" : "2022-01-15T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2022-01-01T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый сериал"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Джейми Дорнан",
		  "Дэймон Херриман",
		  "Оулавюр Дарри Оулафссон",
		  "Шалом Брюн-Фрэнклин",
		  "Алекс Димитриадес",
		  "Даниэль Макдональд",
		  "Damien Strouthos",
		  "Камиль Эллис",
		  "Greg Larsen",
		  "Виктория Харалабиду"
		],
		"allow_offline" : true,
		"world_release_date" : "2022-01-01T00:00:00Z",
		"directors" : [
		  "Chris Sweeney",
		  "Дэниэл Неттхейм"
		]
	  },
	  "year" : 2022,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/9e/98/e87a87b9b9b8953fd76d74afcb79cec2dbf9/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		20,
		7
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Турист",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8856,
	  "title" : "Шан-Чи и легенда десяти колец",
	  "description" : "2021, Боевик, Приключения, Фантастика, Фэнтези",
	  "package_id" : "Shan_Chi_i_legenda_desyati_kolec_2021",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Shan_Chi_i_legenda_desyati_kolec_2021",
	  "description" : "У «Марвел» пополнение. В юности Шон сбежал от деспотичного отца, чтобы не стать оружием в его руках. Но от прошлого не скрыться: скромному портье пятизвёздочного отеля придётся признать, что он является наследником предводителя войска десяти колец. И теперь от его последующих действий зависят не только жизни людей, но и судьба миров. Сочно, аутентично и политкорректно – крепкий фэнтезийный боевик.",
	  "favorite" : false,
	  "countries" : [
		2215,
		1066
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"budget" : 150000000,
		"gross_russia" : 8645561,
		"gross_usa" : 213321384,
		"ratings" : {
		  "imdb" : 7.9000000000000004,
		  "kinopoisk" : 7.2880000000000003
		},
		"cast" : [
		  "Симу Лю",
		  "Тони Люн Чу Вай",
		  "Аквафина",
		  "Мишель Йео",
		  "Чжан Мэнъэр",
		  "Чэнь Фала",
		  "Ронни Чиэн",
		  "Флориан Мунтяну",
		  "Бен Кингсли",
		  "Юэнь Ва"
		],
		"has_hd" : true,
		"allow_offline" : true,
		"duration" : 7956,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Дестин Дэниел Креттон"
		],
		"gross_world" : 402884590
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/b9/29/b958530e61174badbcfcd4e88d1bd28c06fa/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		23,
		4,
		17
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Шан-Чи и легенда десяти колец",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8847,
	  "title" : "Сказки Пушкина. Для взрослых",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Skazki_Pushkina_Dlya_vzroslyh_2021",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Skazki_Pushkina_Dlya_vzroslyh_2021",
	  "description" : "Пять сказок Александра Сергеевича в качестве трамплина, а дальше хулиганская импровизация в реалиях современности и немного на перспективу. И хотя фабула хорошо известна, раскрытие темы увлекает. Рыбак окажется дейтинг-разводилой, царевна не будет вылезать из инстаграм, поп следить за оборотом наркотиков, а золотой петушок предстанет в образе нейросети.",
	  "favorite" : false,
	  "countries" : [
		850
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Ксения Зуева",
		  "Павел Бардин",
		  "Оксана Карас",
		  "Наталья Кудряшова"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Ингеборга Дапкунайте",
		  "Дарья Жовнер",
		  "Лолита Милявская",
		  "Павел Попов",
		  "Денис Шведов",
		  "Алена Свиридова",
		  "Жан-Мишель Щербак",
		  "Андрей Смоляков",
		  "Ирина Безрукова",
		  "Даниил Чуп"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"rate_helper" : "https://www.yandex.ru/images/img/5f/f0/fba09817f911361c96b78c2e22971ac53b4f/rate_helper__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/img/5f/f0/fba09817f911361c96b78c2e22971ac53b4f/secondary_poster__iphone-45.jpeg",
		"poster" : "https://www.yandex.ru/images/img/5f/f0/fba09817f911361c96b78c2e22971ac53b4f/poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Сказки Пушкина. Для взрослых",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 8853,
	  "title" : "В Бореньке чего-то нет",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "V_Borenke_chego_to_net_2021",
	  "description" : "2021, Комедия, Мелодрама"
	},
	"package" : {
	  "id" : "V_Borenke_chego_to_net_2021",
	  "description" : "Сериал «Квартета И» и START на основе популярного одноимённого спектакля. Кино — это мир, в котором слишком много переменных. Успех фильма зависит не только от режиссёра и актёров, но и того, что происходит за кадром. А чего там только не творится: вечные споры сценаристов, интриги, служебные романы и деньги, которых не всегда хватает. И вот наконец вся съёмочная группа собирается на «шапке», банкете после окончания съёмок. В этот вечер они не только пьют шампанское, но и высказывают друг другу всё. Романы подходят к концу, споры утихают, а режиссёр пытается понять, удалось ли ему после сериалов про бандитов и ментов создать что-то «настоящее».",
	  "favorite" : false,
	  "countries" : [
		1127
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Никита Власов"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Максим Виторган",
		  "Ростислав Хаит",
		  "Леонид Барац",
		  "Александр Демидов",
		  "Камиль Ларин",
		  "Виктория Толстоганова",
		  "Алексей Агранович",
		  "Анастасия Уколова",
		  "Юлия Топольницкая",
		  "Павел Майков"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/5a/4e/8302c5220f2d59ee3bd96d3352f0d49292ed/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11,
		13
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "В Бореньке чего-то нет",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9439,
	  "title" : "Нас других не будет",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-05T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-27T18:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "tpr_Nas_drugih_ne_budet_2021",
	  "description" : "2021, Документальный"
	},
	"package" : {
	  "id" : "tpr_Nas_drugih_ne_budet_2021",
	  "description" : "Документальный фильм о личности Сергея Бодрова-младшего глазами киноведа Петра Шепотинника. Проект стал прямым продолжением многочисленных встреч и бесед с Сергеем Бодровым-младшим и Алексеем Балабановым. Создатели фильма пытаются переосмыслить феномен личности известного актера и режиссера. О Сергее рассказывают близкие друзья и соратники: продюсер Сергей Сельянов, художник Надежда Васильева, композитор Вячеслав Бутусов, оператор Сергей Астахов, а также… сам Сергей Бодров-младший и режиссер Алексей Балабанов.",
	  "favorite" : false,
	  "countries" : [
		1519
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-26T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2021-12-27T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Сергей Сельянов",
		  "Надежда Васильева",
		  "Вячеслав Бутусов",
		  "Сергей Астахов"
		],
		"allow_offline" : false,
		"duration" : 4789,
		"directors" : [
		  "Петр Шепотинник"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/a8/ee/84ef91f361ad7e2536c2288b41094886be5f/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		8
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Нас других не будет",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 8913,
	  "title" : "Шершни",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-01-29T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-26T21:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Shershni_2021",
	  "description" : "2021, Драма, Триллер, Ужасы"
	},
	"package" : {
	  "id" : "Shershni_2021",
	  "description" : "История о выживании любой ценой с Кристиной Риччи, Джульетт Льюис и звездой сериала «Сладкая горечь» Эллой Пернелл. Женская команда по футболу терпит крушение на самолете в дикой местности. Выжившие постепенно разбиваются на жестокие кланы, для которых нет никаких моральных рамок. «Шершни» — это захватывающий жанровый коктейль из фильма ужасов, драмы, триллера и детектива. Среди режиссеров сериала — Карин Кусама, поставившая культовый тин-хоррор «Тело Дженнифер».",
	  "favorite" : false,
	  "countries" : [
		1039
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-16T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-09T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Эва Сёрхёуг",
		  "Карин Кусама",
		  "Дипа Мехта",
		  "Джеми Трэвис"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Мелани Лински",
		  "Софи Тэтчер",
		  "Тони Сайпресс",
		  "Элла Пернелл",
		  "Сэмми Ханратти",
		  "Стивен Крюгер",
		  "Кристина Риччи",
		  "Джульетт Льюис",
		  "Кия Кинг",
		  "Уоррен Коул"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/6c/27/3dc90179566d3e2a1af45f2946dd1ef7b5e5/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		21,
		20,
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Шершни",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9419,
	  "title" : "Девочка, которая кричала: «Волки!»",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-05T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-26T18:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Devochka_kotoraya_krichala_volki_2020",
	  "description" : "2020, Драма, Криминал"
	},
	"package" : {
	  "id" : "Devochka_kotoraya_krichala_volki_2020",
	  "description" : "Всегда ли можно верить детям? 14-летняя Холли пишет школьное сочинение, в котором обвиняет отчима в насилии. Родители всё отрицают. Опытный социальный работник Ларс Мэдсен должен в кратчайшие сроки разобраться, кто врёт, а кто говорит правду: семейное дело приводит к народному гневу.",
	  "favorite" : false,
	  "countries" : [
		1970,
		1805,
		530,
		663,
		1585
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-16T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-09T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"ratings" : {
		  "imdb" : 7.7000000000000002,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Бьярне Хенриксен",
		  "Флора Офелия Хофман Линдаль",
		  "Кристин Альбек Борге",
		  "Петер Плаугборг",
		  "Ной Сторм Отто",
		  "Lila Nobel",
		  "Lone Rødbroe",
		  "Джош Джастин Харнум Гертсен",
		  "Расмус Хаммерих",
		  "Laura Skjoldborg"
		],
		"allow_offline" : true,
		"world_release_date" : "2020-10-11T00:00:00Z",
		"directors" : [
		  "Саману Акеке Сальстрём",
		  "Никлас Бендиксен",
		  "Май эль-Туки",
		  "Пернилла Фишер Кристенсен"
		]
	  },
	  "year" : 2020,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/fa/9f/bfe9b195ed6001089602aec7c5426617d297/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		12
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Девочка, которая кричала: «Волки!»",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9207,
	  "title" : "Святой Майк",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сезон"
	  },
	  "package_id" : "Svyatoi_Maik_2018",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Svyatoi_Maik_2018",
	  "description" : "Мошенник Майк Шефер, спасаясь от полиции, меняет свою поддельную форму кондуктора на рясу, что помогает ему ускользнуть от длинных рук представителей закона, однако вместо этого он попадает в цепкие руки привратницы местной церкви Марии, которая, встретив его в церковном одеянии, решила, что он является долгожданным новым священником, отцом Зандманом. В результате, берлинский уголовник, некрещенный и необремененный совестью, неожиданно для себя становится священником церкви в городе Лейтерберг.",
	  "favorite" : false,
	  "countries" : [
		56
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-15T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-08T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Sven Fehrensen"
		],
		"ratings" : {
		  "imdb" : 7,
		  "kinopoisk" : 8.1099999999999994
		},
		"cast" : [
		  "Даниэль Донской",
		  "Беттина Бурхард",
		  "Мари Бурхард",
		  "Винсент Крюгер",
		  "Сюзи Банзхаф"
		],
		"has_hd" : false
	  },
	  "year" : 2018,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/5c/43/953eb69a9ceab315567f1b44395f5a6d2aa2/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Святой Майк",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9440,
	  "title" : "G. I. Joe. Бросок кобры: Снейк Айз",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-02-05T18:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-23T18:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "G_I_Joe_Brosok_kobry_Sneik_Ais_2021",
	  "description" : "2021, Боевик, Приключения, Триллер, Фантастика, Фэнтези"
	},
	"package" : {
	  "id" : "G_I_Joe_Brosok_kobry_Sneik_Ais_2021",
	  "description" : "Зрелищный экшн с восточным колоритом о герое франшизы «Бросок кобры» – скрытном бойце элитного спецотряда G. I. Joe. Он называет себя Снейк Айз, хранит в тайне своё прошлое и не заводит близких связей. Знакомство с наследником могущественного японского клана даёт ему непростой выбор. Останется ли он одиночкой или послужит великой цели и остановит крупнейшую террористическую организацию в мире.",
	  "favorite" : false,
	  "countries" : [
		854
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"gross_usa" : 28264325,
		"gross_russia" : 1171946,
		"directors" : [
		  "Роберт Швентке"
		],
		"ratings" : {
		  "imdb" : 5.4000000000000004,
		  "kinopoisk" : 5.4610000000000003
		},
		"cast" : [
		  "Генри Голдинг",
		  "Эндрю Кодзи",
		  "Урсула Корберо",
		  "Харука Абэ",
		  "Такэхиро Хира",
		  "Питер Менса",
		  "Самуэль Финци",
		  "Самара Уивинг",
		  "Эри Исида",
		  "Ико Уайс"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 40064325,
		"budget" : 88000000,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"duration" : 6975,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-22T21:00:00Z",
		  "kind" : "new",
		  "visible_at" : "2021-12-23T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новинка"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/6a/7f/296a6f6fd1ed3daa69e2c105f3c4db622dac/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		23,
		4,
		20,
		17
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "G. I. Joe. Бросок кобры: Снейк Айз",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9260,
	  "title" : "Станция одиннадцать",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-05T10:01:00Z",
		"kind" : "custom",
		"visible_at" : "2022-01-07T10:01:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Stantsiya_11_2021",
	  "description" : "2021, Детектив, Драма, Триллер, Фантастика"
	},
	"package" : {
	  "id" : "Stantsiya_11_2021",
	  "description" : "Экранизация мирового бестселлера. Вирус унес жизни большей части населения планеты. Через 20 лет после пандемии жизнь так не вернулась в нормальное русло. Несколько бродячих артистов колесят по стране, надеясь хоть что-то восстановить. В очередном городке они сталкиваются с последователями нового религиозного культа. Фанатики во главе с самопровозглашенным Пророком переосмыслили реальность с поправкой на бесчеловечность.",
	  "favorite" : false,
	  "countries" : [
		2567
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"has_hd" : false,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T10:01:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-07T10:01:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Джо Пинг",
		  "Маккензи Дэвис",
		  "Даниэль Дедуайлер",
		  "Химеш Патель",
		  "Дэвид Уилмот",
		  "Набхан Ризван",
		  "Дилан Тейлор",
		  "Матильда Лоулер",
		  "Филиппина Вельж",
		  "Дебора Кокс"
		],
		"allow_offline" : true,
		"world_release_date" : "2021-12-16T00:00:00Z",
		"directors" : [
		  "Хиро Мурай"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/ea/08/778ae86ded0b0daeab3761877e4ef3bef3b8/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		22,
		20,
		9,
		7
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Станция одиннадцать",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9233,
	  "title" : "Клаустрофобы 2: Лига выживших",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-14T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-15T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Klaustrofoby_2_Liga_vyzhivshih_2021",
	  "description" : "2021, Боевик, Ужасы"
	},
	"package" : {
	  "id" : "Klaustrofoby_2_Liga_vyzhivshih_2021",
	  "description" : "Однажды они уже выбрались из кровавого квеста и теперь пытаются разобраться, кто же загнал их в эту ловушку. В погоне за ответами герои снова попадают в лабиринт садистской игры. Головоломки окажутся еще сложнее, испытания – жестче, подставы – безжалостнее. Самые глубинные страхи будут вытянуты на поверхность, чтобы сломить волю выживших.",
	  "favorite" : false,
	  "countries" : [
		2117,
		672
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"gross_usa" : 25188958,
		"gross_russia" : 1782982,
		"directors" : [
		  "Адам Робител"
		],
		"world_release_date" : "2021-07-01T00:00:00Z",
		"ratings" : {
		  "imdb" : 5.7999999999999998,
		  "kinopoisk" : 5.8890000000000002
		},
		"cast" : [
		  "Тейлор Расселл",
		  "Логан Миллер",
		  "Дебора Энн Уолл",
		  "Томас Кокерел",
		  "Холлэнд Роден",
		  "Индия Мур",
		  "Карлито Оливеро",
		  "Мэтт Эсоф",
		  "Джеми-Ли Мани",
		  "Уэйн Харрисон"
		],
		"allow_offline" : true,
		"has_hd" : true,
		"gross_world" : 51788958,
		"budget" : 15000000,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"russian_release_date" : "2021-09-23T00:00:00Z",
		"duration" : 5526,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-15T21:00:00Z",
		  "theme" : "dark",
		  "text" : "На это раз выхода нет"
		}
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/e8/7b/cb154b341871c1bd207d2961d2f9b9fa8d5b/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		21,
		4
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Клаустрофобы 2: Лига выживших",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8938,
	  "title" : "Непосредственно Каха. Сказки",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Neposredstvenno_Kaha_Skazki_2021",
	  "description" : "2021, Комедия"
	},
	"package" : {
	  "id" : "Neposredstvenno_Kaha_Skazki_2021",
	  "description" : "Серго попадает в больницу, после того как испытал на себе новую вакцину. Все, кто навещает героя, должны рассказать ему сказку. Каждая серия — это новая сказка, которую Пушкин или Каха рассказывают Серго в стиле веб-сериала «Непосредственно Каха».",
	  "favorite" : false,
	  "countries" : [
		1323
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"russian_release_date" : "2021-11-19T00:00:00Z",
		"directors" : [
		  "Данила Иванов"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Артем Карокозян",
		  "Артем Калайджян",
		  "Александр Сошкин"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/ed/6b/54b7ee445ede1696a71a976bbda8b4eae261/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Непосредственно Каха. Сказки",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 9256,
	  "title" : "Фрэнк из Ирландии",
	  "description" : "2021, Комедия",
	  "package_id" : "Frenk_iz_Irlandii_2021",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Frenk_iz_Irlandii_2021",
	  "description" : "Комедия про позднее взросление с братьями Глисон в главных ролях. «Фрэнк из Ирландии» рассказывает о беззаботной жизни инфантила, мизантропа и фантазера. Его зовут Фрэнк (Брин Глисон), и он не спешит взрослеть несмотря на то, что ему уже стукнуло 32 года. Однако в какой-то момент его семью такое положение дел начинает откровенно бесить, и родственники решают, что пора парню найти работу, квартиру и научиться брать на себя ответственность.",
	  "favorite" : false,
	  "countries" : [
		1669
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "М.Дж. Делани",
		  "Деклан Лауни"
		],
		"ratings" : {
		  "imdb" : 6.7000000000000002,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Пом Бойд",
		  "Брин Глисон",
		  "Донал Глисон",
		  "Сара Грин",
		  "Том Вон-Лолор",
		  "Лиз Фитцгиббон",
		  "Пэт Шорт",
		  "Paul Forman",
		  "Ниал Кьюсак",
		  "Энн Броган"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/9a/41/dc2c0a8b33f6bc5edfa9bbca9577b8e03610/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		11
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Фрэнк из Ирландии",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8566,
	  "title" : "Босс-молокосос 2",
	  "description" : "2021, Для детей, Комедия, Мультфильм, Приключения, Семейный",
	  "package_id" : "Boss_molokosos_2_2021",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Boss_molokosos_2_2021",
	  "description" : "Босс-молокосос вырос и теперь управляет инвестфондом. Его старший брат обзавелся семьей и старается быть хорошим отцом. В продолжении номинированного на «Оскар» мультфильма Тим и Тед снова будут переосмысливать внутрисемейные отношения. Их ждет настоящий водоворот приключений – и все из-за дочек Тима. Девочки пытаются разоблачить директора престижной школы, который слишком активно лепит из детей вундеркиндов.",
	  "favorite" : false,
	  "countries" : [
		200
	  ],
	  "parental_rating" : 6,
	  "meta" : {
		"budget" : 82000000,
		"gross_russia" : 12992781,
		"gross_usa" : 57193700,
		"ratings" : {
		  "imdb" : 5.9000000000000004,
		  "kinopoisk" : 5.8029999999999999
		},
		"cast" : [
		  "Алек Болдуин",
		  "Джеймс Марсден",
		  "Эми Седарис",
		  "Ариана Гринблатт",
		  "Джефф Голдблюм",
		  "Ева Лонгория",
		  "Джеймс МакГрат",
		  "Джимми Киммел",
		  "Лиза Кудроу",
		  "Рафаэль Алехандро"
		],
		"has_hd" : true,
		"allow_offline" : true,
		"duration" : 6443,
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Том МакГрат"
		],
		"gross_world" : 110503700
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/dc/63/18cebc66d260e07b07b83e8b0b5f0a78dc50/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		15,
		11,
		17,
		18,
		1
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Босс-молокосос 2",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8498,
	  "title" : "Инсомния",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Insomniya_2021",
	  "description" : "2021, Драма"
	},
	"package" : {
	  "id" : "Insomniya_2021",
	  "description" : "Гоша Куценко, Ирина Старшенбаум, Мария Миронова, Александр Робак — в мистической драме про реинкарнацию. Юрий Шталь — преуспевающий психотерапевт-гипнолог. Убежденный агностик, он способен рационально объяснить все что угодно, кроме собственных ночных кошмаров. Во сне его преследуют бывшая жена Катя, погибшая много лет назад, рыжеволосая незнакомка и загадочный символ, напоминающий знак бесконечности. Из-за этих видений Юрий не может спать и коротает бессонницу, выпивая в стрип-клубе. Там он знакомится со стриптизершей Аней, на шее которой замечает татуировку, повторяющую знак бесконечности из его снов. После их встречи Юрий обнаруживает новый метод, позволяющий помогать самым сложным пациентам и разгадать тайну собственной бессонницы.",
	  "favorite" : false,
	  "countries" : [
		1617
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"directors" : [
		  "Ольга Френкель"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Гоша Куценко",
		  "Ирина Старшенбаум",
		  "Мария Миронова",
		  "Александр Робак",
		  "Кирилл Кяро",
		  "Никита Ефремов",
		  "Роза Хайруллина",
		  "Игорь Миркурбанов",
		  "Тамара Крцунович",
		  "Денис Корнух"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/7e/01/931820277ea81391dd2bcac83c91a697115b/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Инсомния",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9146,
	  "title" : "Джо Пикетт",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "2022-02-05T07:01:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-07T07:01:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Dzho_Pikett_2021",
	  "description" : "2021, Детектив"
	},
	"package" : {
	  "id" : "Dzho_Pikett_2021",
	  "description" : "Расследование преступлений, тем более убийств, не входит в обязанности лесничего Управления лесного хозяйства Вайоминга. Однако именно этим займется Джо Пикетт в сериале по детективным романам Си Джей Бокса. И, конечно, тем самым подвергнет опасности не только жизнь своей семьи, но и всех, кто ему помогает. Простой егерь теперь как кость поперёк горла у людей, проворачивающих в округе нечистые дела.",
	  "favorite" : false,
	  "countries" : [
		587
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"is_final" : false,
		"directors" : [
		  "Дрю Даудл",
		  "Джон Эрик Даудл",
		  "Эверардо Валерио Гоут"
		],
		"ratings" : {
		  "imdb" : 7.2000000000000002,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Джулианна Гуилл",
		  "Майкл Дорман",
		  "Скайуокер Хьюз",
		  "Зебастен Боржо",
		  "Оливер Манделкорн",
		  "Брендан Флетчер",
		  "Патрик Галлахер",
		  "Чад Рук",
		  "Кайл Мак",
		  "Камрин Пилва"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/1d/ff/34bc478d333d6279bf8151a90eb6c2c2cfe3/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Джо Пикетт",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9373,
	  "title" : "Мой психолог — Мистер Голубь",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новое в подписке"
	  },
	  "package_id" : "Moi_psiholog_Mister_golub_2021",
	  "description" : "Еще 3000+ фильмов\r\n"
	},
	"package" : {
	  "id" : "Moi_psiholog_Mister_golub_2021",
	  "description" : "Шестнадцатилетний Джеймс Уитмен изо всех сил пытается справиться с фрустрацией из-за непонятного исчезновения своей сестры. Родители запрещают даже упоминать о ней. Юноша сдерживает свою тревогу аффирмациями и беседами с воображаемым психотерапевтом, по совместительству голубем. Главный вывод, к которому он приходит – всё не то, чем кажется.",
	  "favorite" : false,
	  "countries" : [
		1627
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : true,
		"ratings" : {
		  "imdb" : 6.0999999999999996,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Тейлор Расселл",
		  "Джейсон Айзекс",
		  "Чейз Стоукс",
		  "Лиза Эдельштейн",
		  "Дэвид Аркетт",
		  "Том Уилкинсон",
		  "Лукас Джейд Зуманн",
		  "Яя Госселин",
		  "Кэролайн Фридлюнд",
		  "Хантер Денойеллс"
		],
		"allow_offline" : true,
		"duration" : 6308,
		"world_release_date" : "2021-01-12T00:00:00Z",
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Янив Раз"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/secondary_poster__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/rate_helper__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/tile__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/9c/a8/a64aa2d5a787de044761b542d03897adf4b6/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		11,
		7
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Мой психолог — Мистер Голубь",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9206,
	  "title" : "Киберсталкер",
	  "banner_sticker" : {
		"color" : "#F7791C",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "dark",
		"text" : "Новый сериал"
	  },
	  "package_id" : "Kiberstalker_2019",
	  "description" : "2021, Драма"
	},
	"package" : {
	  "id" : "Kiberstalker_2019",
	  "description" : "Учеба в престижном колледже становится для 18-летнего Люки настоящим испытанием. Ежедневные насмешки сверстников делают его жизнь невыносимой. Чтобы отомстить обидчикам, парень взламывает аккаунты одноклассников и так узнает подробности личной жизни своей возлюбленной Альмы. Обладая секретной информацией, бывший изгой Люка превращается в звезду школы, но вскоре попадает в собственную ловушку.",
	  "favorite" : false,
	  "countries" : [
		225
	  ],
	  "parental_rating" : 16,
	  "meta" : {
		"allow_offline" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-14T21:00:00Z",
		  "kind" : "new_episode",
		  "visible_at" : "2022-01-07T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Новый эпизод"
		},
		"directors" : [
		  "Саймон Буиссон"
		],
		"ratings" : {
		  "imdb" : 7.2000000000000002,
		  "kinopoisk" : 7.21
		},
		"cast" : [
		  "Пабло Кобо",
		  "Азизе Диабате Абдулай",
		  "Тео Фернандез",
		  "Ясин Уиша",
		  "Кармен Кассовиц",
		  "Клеман Сибони",
		  "Манон Валентин",
		  "Рио Вега",
		  "Анна-Мей Фабр",
		  "Зои Херан"
		],
		"has_hd" : false
	  },
	  "year" : 2019,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/e4/a3/fdf01a56e456f1d142b295d18e00217a8ea3/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Киберсталкер",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8429,
	  "title" : "Контакт",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Kontakt_2021",
	  "description" : "2021, Драма"
	},
	"package" : {
	  "id" : "Kontakt_2021",
	  "description" : "Драматический сериал о взаимоотношениях подростков и родителей в эпоху соцсетей. Глеб Барнашов — крутой опер, но разжалован в инспекторы по делам несовершеннолетних. К тому же его бросила жена, и он в одиночку воспитывает дочь Юлю, которая его ненавидит и винит в разрыве с матерью. Барнашов — мужчина с принципами, но ему придется ими поступиться, чтобы наладить контакт с дочерью. Для этого он регистрируется в соцсети под видом парня-подростка.",
	  "favorite" : false,
	  "countries" : [
		177
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : false,
		"is_final" : false,
		"directors" : [
		  "Евгений Стычкин"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 7.4589999999999996
		},
		"cast" : [
		  "Павел Майков",
		  "Ирина Паутова",
		  "Карина Александрова",
		  "Дмитрий Мальков",
		  "Равшана Куркова",
		  "Алексей Лукин",
		  "Александр Трачевский",
		  "Вильма Кутавичюте",
		  "Алексей Агранович",
		  "Максим Виторган"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/18/66/efc7a96694dda1c446eac153ec9be1790aaf/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Контакт",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "dark",
	  "id" : 9201,
	  "title" : "Митчеллы против машин",
	  "banner_sticker" : {
		"color" : "#24B56D",
		"visible_until" : "2022-01-12T21:00:00Z",
		"kind" : "custom",
		"visible_at" : "2021-12-13T21:00:00Z",
		"theme" : "dark",
		"text" : "Новинка"
	  },
	  "package_id" : "Mitchelly_protiv_Mashin_2021",
	  "description" : "2021, Для детей, Комедия, Мультфильм, Приключения, Семейный, Фантастика"
	},
	"package" : {
	  "id" : "Mitchelly_protiv_Mashin_2021",
	  "description" : "В семействе Митчеллов типичная нестыковка мнений поколений. Поэтому дочь Кэти так рада возможности уехать учиться в другой город. Но папа так просто дочурку не отпустит: он придумал устроить большое семейное путешествие, в котором их и застанет повсеместно начавшееся восстание гаджетов. Не прекращая своих семейных разборок, Митчеллы геройствуют против слетевшей с катушек техники.",
	  "favorite" : false,
	  "countries" : [
		751,
		903,
		2546
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"has_hd" : true,
		"sticker" : {
		  "color" : "#24B56D",
		  "visible_until" : "2022-01-12T21:00:00Z",
		  "kind" : "custom",
		  "visible_at" : "2021-12-13T21:00:00Z",
		  "theme" : "dark",
		  "text" : "Семейный беспредел"
		},
		"ratings" : {
		  "imdb" : 7.7000000000000002,
		  "kinopoisk" : 7.6139999999999999
		},
		"cast" : [
		  "Эбби Джейкобсон",
		  "Дэнни Макбрайд",
		  "Майя Рудольф",
		  "Майкл Рианда",
		  "Эрик Андре",
		  "Оливия Колман",
		  "Фред Армисен",
		  "Бек Беннетт",
		  "Крисси Тиган",
		  "Джон Ледженд"
		],
		"allow_offline" : true,
		"duration" : 6324,
		"world_release_date" : "2021-04-22T00:00:00Z",
		"bitrates" : [
		  596000,
		  1296000,
		  2096000,
		  3596000,
		  7096000
		],
		"directors" : [
		  "Майкл Рианда",
		  "Джефф Роу"
		]
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/poster_2018__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/secondary_poster__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/tile__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/tile_history__iphone-45.jpeg",
		"rate_helper_2" : "https://www.yandex.ru/images/Film/ce/5b/783b556bcc75f33072120c6c5cc5bd60d17d/rate_helper_2__iphone-45.jpeg"
	  },
	  "genres" : [
		15,
		22,
		11,
		17,
		18,
		1
	  ],
	  "kind" : "Film",
	  "available_through_landing" : false,
	  "name" : "Митчеллы против машин",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "id" : 8968,
	  "title" : "Гоморра",
	  "description" : "2021, Драма, Криминал",
	  "package_id" : "Gomorra_2014",
	  "color" : "dark"
	},
	"package" : {
	  "id" : "Gomorra_2014",
	  "description" : "История о людях и судьбах, связанных с жестокой и могущественной неаполитанской преступной организацией. Рассказ о жизни мафиозного клана изнутри, увиденной глазами 30-летнего Чиро, верного помощника крестного отца Пьетро Савастано.",
	  "favorite" : false,
	  "countries" : [
		85,
		56
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Франческа Коменчини",
		  "Клаудио Капеллини",
		  "Стефано Соллима"
		],
		"ratings" : {
		  "imdb" : 8.6999999999999993,
		  "kinopoisk" : 7.9800000000000004
		},
		"cast" : [
		  "Сальваторе Эспозито",
		  "Марко Д’Амор",
		  "Кристиана Делль’Анна",
		  "Фортунато Серлино",
		  "Ивана Лотито",
		  "Фабио Де Каро",
		  "Кристина Донадио",
		  "Christian Giroso",
		  "Джованни Бузелли",
		  "Arturo Muselli"
		],
		"has_hd" : false
	  },
	  "year" : 2014,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/10/96/f6e732ffcd6e7fcba9fc5e42292b6010d02f/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		9,
		12
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Гоморра",
	  "persons" : null
	}
  },
  {
	"banner" : {
	  "screen" : "main",
	  "color" : "",
	  "id" : 8576,
	  "title" : "Самка богомола",
	  "banner_sticker" : {
		"color" : "",
		"visible_until" : "0001-01-01T00:00:00Z",
		"kind" : "custom",
		"visible_at" : "0001-01-01T00:00:00Z",
		"theme" : "",
		"text" : ""
	  },
	  "package_id" : "Samka_bogomola_2021",
	  "description" : "2021, Детектив, Драма, Триллер"
	},
	"package" : {
	  "id" : "Samka_bogomola_2021",
	  "description" : "Серийная убийца Жанна Дронова, получившая прозвище «самка богомола», отбывает срок с тех пор, как созналась в серии леденящих кровь убийств. 20 лет назад она жестоко расправлялась с мужчинами — педофилами, насильниками и неверными мужьями. В наши дни у Жанны появляется подражатель, в точности копирующий совершённые ей убийства. Героиня предлагает полиции помощь и ставит два условия. Она покинет колонию на время расследования, а делом будет заниматься её сын, который давно вычеркнул мать из своей жизни.",
	  "favorite" : false,
	  "countries" : [
		850
	  ],
	  "parental_rating" : 18,
	  "meta" : {
		"allow_offline" : true,
		"directors" : [
		  "Нурбек Эген"
		],
		"ratings" : {
		  "imdb" : 0,
		  "kinopoisk" : 0
		},
		"cast" : [
		  "Ирина Розанова",
		  "Павел Чинарёв",
		  "Ольга Сутулова",
		  "Екатерина Кузнецова",
		  "Сабина Ахмедова",
		  "Александр Марин",
		  "Сергей Заморев",
		  "Виктория Агалакова",
		  "Арсений Мыцык",
		  "Никита Крахмалев"
		],
		"has_hd" : false
	  },
	  "year" : 2021,
	  "images" : {
		"poster" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/poster__iphone-45.jpeg",
		"poster_2018" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/poster_2018__iphone-45.jpeg",
		"tile" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/tile__iphone-45.jpeg",
		"poster_2020" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/poster_2020__iphone-45.jpeg",
		"rate_helper" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/rate_helper__iphone-45.jpeg",
		"tile_vertical" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/tile_vertical__iphone-45.jpeg",
		"tile_history" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/tile_history__iphone-45.jpeg",
		"secondary_poster" : "https://www.yandex.ru/images/Season/4f/f0/14be6f8097244951f70f4910564be0bfdc4c/secondary_poster__iphone-45.jpeg"
	  },
	  "genres" : [
		20,
		9,
		7
	  ],
	  "kind" : "Series",
	  "available_through_landing" : false,
	  "name" : "Самка богомола",
	  "persons" : null
	}
  }
]
"""
	.data( using: .utf8 )
#endif
