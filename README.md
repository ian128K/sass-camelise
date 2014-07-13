sass-camelise
=============

Sass function for converting an input string to CamelCase. Defaults to UpperCamelCase. For lowerCamelCase, pass `$lower` as `true`.

	@function camelise($string, $lower: false)
		// load the input into a buffer for manipulation
		$buffer: $string
	
		// list of characters to exclude
		$exclude: " ", "-", "–", "—", "_", ",", ";", ":", ".", "(", ")", "[", "]", "'", '"'

		// declare loop variables outside of the loop
		$char: ""
		$prev: ""
		$result: ""
	
		// loop through each character of the buffer
		@for $i from 1 through str-length($buffer)
	
			// assign the current character to a variable
			$char: str-slice($buffer, $i, $i)
	
			@if $i == 1
			
				// if the character is an excluded character…
				@if not not index($exclude, $char)

					// …don't add it to the result string we're building
					$result: $result

				// otherwise transform case of the first character based on $lower
				@else if $lower == true
					$result: to-lower-case($char)
				@else
					$result: to-upper-case($char)
	
			@else // build the rest of the string

				// assign the previous character in the buffer to a variable
				$prev: str-slice($buffer, $i - 1, $i - 1)
	
				// if current $char == $exclude, do nothing
				@if not not index($exclude, $char)
					$result: $result
	
				// if $char should be capitalised, do so
				@else if not not index($exclude, $prev)
					$result: $result + to-upper-case($char)
	
				// otherwise, add $char to $result
				@else
					$result: $result + $char
		@return $result
