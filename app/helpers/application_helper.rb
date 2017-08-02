module ApplicationHelper
	def generate_pagination(args={})
		limit = args[:limit].to_i
		offset = args[:offset].to_i
		total = args[:total].to_i

		url = request.path
		first_page = 1
		last_page = (total%limit == 0) ? total/limit : total/limit+1
		current_page = offset/limit+1

		arr = []

		if current_page - first_page == 0
			arr << "<li><a href='#{url}?offset=#{(current_page-1)*limit}&&limit=#{limit}'>&laquo;</a></li>"
		else
			arr << "<li><a href='#{url}?offset=#{(current_page-2)*limit}&&limit=#{limit}'>&laquo;</a></li>"
		end

		if current_page - first_page <3
			begin_page = first_page
		else
			begin_page = current_page -2
		end

		if last_page - current_page < 3
			end_page = last_page
		else
			end_page = current_page +2
		end

		# if (end_page - begin_page < 5)
			
		# end


		
		(begin_page..end_page).each_with_index{|i| 
			arr << "<li><a href='#{url}?offset=#{(i-1)*limit}&&limit=#{limit}'>#{i}</a></li>"

		}


		if last_page - current_page == 0
			arr << "<li><a href='#{url}?offset=#{(current_page-1)*limit}&&limit=#{limit}'>&raquo;</a></li>"
		else
			arr << "<li><a href='#{url}?offset=#{(current_page)*limit}&&limit=#{limit}'>&raquo;</a></li>"
		end		    

		return raw arr.join("")
	end
end
