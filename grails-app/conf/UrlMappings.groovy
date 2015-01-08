class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
        "/other"(view:"/other")
		"/default"(view:"/default")
		"500"(view:'/error')
	}
}
