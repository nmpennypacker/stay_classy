require 'nokogiri'

module StayClassyProcess

	# Once you've built an instance of stay_classy, it's time to hand it over to the channel 6 news team.
	def process( stay_classy )

		prefix = stay_classy.instance_variable_get( :@prefix )
		view_dirs = stay_classy.instance_variable_get( :@view_directories )

		printf "\nDirectories to make classy with prefix #{ prefix }: \n".colorize( :yellow )
		view_dirs.map { |vd| printf "#{ vd }\n" }

		# Send the right files to the news team...
		printf "\nFiles to make classy: \n".colorize( :yellow )
		view_dirs.each do |vd|
			Dir.foreach( vd ) do |file|
				begin

					if file.match( StayClassy::Builder::VIEW_FILE_TYPES_REGEX )

						# Brian Fantana for Sex Pantherization.
						# He gets @doc for the rest of the team.
						brian_fantana( file )

						# Champ Kind takes @doc for sex and chicken
						champ_kind( @doc )

						# Puts @doc in a toaster...fantastic
						brick_tamland( @doc )

						# Wears a bra next time
						veronica_corningstone( @doc )
					end

				rescue Exception => e

      		p "#{e}"

				end
  		end
  	end

	end

############### LADIES AND GENTLEMEN, NEWS TEAM 6 ###############

	# Get the bits of real panther so you know it's good
	def load_file( file )
		@doc ||= Nokogiri::HTML::Document.parse( file )
	end
	alias :brian_fantana :load_file

	# Slap some BBQ sauce on them elements and... Hawoooooooo, woo, woo, woo!!!!
	def add_classes_to_file( file )
		printf "#{ file } - Champ Kind, whammy!\n"
	end
	alias :champ_kind :add_classes_to_file

	# Invite the ids to the pants party
	def add_ids_to_file( file )
		printf "#{ file } - Brick Tamland licking a toaster\n"
	end
	alias :brick_tamland :add_ids_to_file

	# Thanks for listening, San Diego. And stay classy, San Diego. Thanks for listening, San Diego.
	def save_new_file( file )
		printf "#{ file } - Veronica Corningstone, signing off\n"
	end
	alias :veronica_corningstone :save_new_file

#################################################################
	
	def baxter( file )
		printf "#{ file }\n"
	end
end