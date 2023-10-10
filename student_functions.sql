create or replace function addStudent 
	(p_stname student.st_name%type)
	returns INTEGER as 
$$
declare 
	v_studid INTEGER;
begin
	insert into student (st_name) 
	values(p_stname)
	returning st_id
	into v_studid;
	return v_studid;
end;
$$ language plpgsql;

create or replace function addSubject 
	(p_subname subject.sb_name%type, p_subsyllabus subject.sb_syllabus%type)
	returns INTEGER as 
$$
declare 
	v_sbid INTEGER;
begin
	insert into subject (sb_name, sb_syllabus) 
	values(p_subname, p_subsyllabus)
	returning sb_id
	into v_sbid;
	return v_sbid;
end;
$$ language plpgsql;


create or replace function addAcheivement
	(p_stid acheivement.st_id%type, p_sbid acheivement.sb_id%type)
	returns INTEGER as 
$$
declare 
	v_achid INTEGER;
begin
	insert into acheivement (st_id, sb_id)
	values(p_stid, p_sbid)
	returning sb_id
	into v_achid;
	return v_achid;
end;
$$ language plpgsql;

/*---------------------------------------------------------*/
select addstudent('Lisa');
select addsubject('Sports', 'Running');
select addacheivement('7', '2');

select * from student;
select * from subject;
select * from acheivement;
