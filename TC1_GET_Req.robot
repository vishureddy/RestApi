*** Settings ***
Library	RequestsLibrary


*** Variables ***
${base_url}	http://dummy.restapiexample.com
${type}		employee
${number}	1


*** Test Cases ***
Get_EmployeeInfo
	create session	mysession	${base_url}
	${response}=	get request	mysession	/api/v1/${type}/{number}
	log to console	${response.status_code}
	#log to console	${response.content}
	#log to console	${response.headers}i


#Validations

	${status_code}=	convert to string	${response.status_code}
	should be equal	${status_code}	406
