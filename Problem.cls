Class User.InterviewProblem Extends %Persistent
{

ClassMethod Init() As %Status
{
		set values = {}
		set values.words = "the quick brown fox jumps over the lazy dog"
		set values.numbers = 17
		set values.date = "02/06/2019"
		
		set values = values.%GetIterator()
		
		while values.%GetNext(.key, .value) {
			set function = $select(key="numbers": ..Translate(value), 
					   			   key="date": ..Convert(value),
					   			   key="words": ..Finder(value))
			write !,function
		}
		return $$$OK
}

ClassMethod Translate(val As %String) As %String
{
	set converted = ""
	for x=1:1:val {
		set converted = converted_"I"
	}
	
	set converted = $REPLACE(converted,"IIIII", "V")
	set converted = $REPLACE(converted,"IIII","IV")
	set converted = $REPLACE(converted,"VV","X")
	set converted = $REPLACE(converted,"VIV", "IX")
	set converted = $REPLACE(converted,"XXXXX", "L")
	set converted = $REPLACE(converted,"LL", "C")
	set converted = $REPLACE(converted,"LXL", "XC")
	set converted = $REPLACE(converted,"CCCCC", "D")
	set converted = $REPLACE(converted,"CCCC", "CD")
	set converted = $REPLACE(converted,"DD", "M")
	set converted = $REPLACE(converted,"DCD", "CM")
	
	return converted
}

ClassMethod Convert(val As %String) As %String
{
	set pDate = val
	Set tNewDate = ""
	if $find(pDate,"/") > 1 {
		set tYear = $piece(pDate,"/",3,3)
		set tDay = $piece(pDate,"/",2,2)
		set tMonth = $piece(pDate,"/",1,1)
		set tNewDate = tYear_tMonth_tDay
	}	
	else {
		Set tNewDate = pDate
	} 
	return tNewDate
}

ClassMethod Finder(val As %String) As %String
{
	set position = $length(val) - $find($reverse(val),$reverse("the")) 
	return position
}
