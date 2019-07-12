Class User.InterviewProblem Extends %Persistent
{

ClassMethod Init() As %Status
{
		
		set values = {}
		set values.words = "blah"
		set values.numbers = 345345
		set values.date = "02/06/2019"
		
		set values = values.%GetIterator()
		
		while values.%GetNext(.key, .value) {
			set function = $select(key="words": ..Shift(value), 
					   			   key="numbers": ..Convert(value), 
					   			   key="date": ..Simplify(value))
		}
		return $$$OK
}

ClassMethod Convert(val As %String) As %String
{
		write "hello"
		return $$$OK
}

ClassMethod Shift(val As %String) As %String
{
		write "hello"
		return $$$OK
}

ClassMethod Simplify(val As %String) As %String
{
	set pDate = val
	Set tNewDate = ""
	if $FIND(pDate,"/")> 1 {
		set tYear = $PIECE(pDate,"/",3,3)
		set tDay = $PIECE(pDate,"/",2,2)
		set tMonth = $PIECE(pDate,"/",1,1)

		if $LENGTH(tDay) = 1 {
			set tDay = "0"_tDay
		}

		if $LENGTH(tMonth) = 1 {
			set tMonth = "0"_tMonth
		}
			set tNewDate = tYear_tMonth_tDay
	}	
	else {
		Set tNewDate = pDate
	}
	write tNewDate
	return $$$OK
}
