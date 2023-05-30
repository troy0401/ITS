<?php
class Model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
    }

     public function select_all($table)
    {
        $query = $this->db->get($table);
        return $query;
    }

    public function select_all_with_limit($table)
    {
        $query = $this->db->query("SELECT * FROM $table LIMIT 1");
        return $query;
    }

     public function select_table_with_id($table,$column,$id)
    {
        $query = $this->db->query("SELECT * FROM $table WHERE $column='$id'");
        return $query;
    }

      public function select_final_quest($id,$limit)
    {
        $query = $this->db->query("SELECT a.*, b.subj_name FROM test_quest a LEFT JOIN subject b ON a.subj_id=b.subj_id WHERE a.subj_id='$id' ORDER BY RAND() LIMIT $limit");
        return $query;
    }

    public function select_table_with_id_limit($table,$column,$id,$limit)
    {
        $query = $this->db->query("SELECT * FROM $table WHERE $column='$id'  ORDER BY RAND() LIMIT $limit");
        return $query;
    }

    public function select_table_with_id2($table,$column,$id)
    {
        $query = $this->db->query("SELECT * FROM $table WHERE $column='$id'");
        return $query->result();
    }

	public function update_where_dual_column($table,$setCol,$setVal,$col1,$col_id1,$col2,$col_id2)
    {
        $qry = $this->db->query("UPDATE $table SET $setCol = $setVal WHERE $col1 = '$col_id1' AND $col2 = $col_id2");
        return TRUE;
    }
	
	 public function users($email)
    {
        $qry = $this->db->query("SELECT * FROM account WHERE accnt_user='$email'");
        return $qry->result();
    }


    public function select_dual_column($table,$col1,$id1,$col2,$id2){
        $qry = $this->db->query("SELECT * FROM $table WHERE $col1=$id1 AND $col2=$id2");
        return $qry;
    }

     public function select_tri_column($table,$col1,$id1,$col2,$id2,$col3,$id3){
        $qry = $this->db->query("SELECT * FROM $table WHERE $col1=$id1 AND $col2=$id2 AND $col3=$id3");
        return $qry;
    }

     public function select_account($id)
    {
        $qry = $this->db->query("SELECT a.*, a.account_id, b.*, d.* FROM accounts a LEFT JOIN course b ON a.course_id=b.course_id LEFT JOIN rank d ON d.rank_id = a.rank_id WHERE a.account_id='$id'");
        return $qry->result();
    }

     public function select_personalinfo($id)
    {
        $qry = $this->db->query("SELECT a.*, a.account_id, b.*,c.*, d.* FROM accounts a INNER JOIN course b ON a.course_id=b.course_id INNER JOIN rank d ON d.rank_id = a.rank_id INNER JOIN personal_information c ON c.account_id = a.account_id WHERE a.account_id='$id'");
        return $qry->result();
    }

    public function select_announcement(){
        $qry = $this->db->query("SELECT a.*, b.* FROM announcement a LEFT JOIN course b ON a.course_id=b.course_id");
        return $qry;
    }

    public function select_announcement_modal($id){
        $qry = $this->db->query("SELECT a.*, b.* FROM announcement a LEFT JOIN course b ON a.course_id=b.course_id WHERE a.announce_id='$id'");
        return $qry;
    }

    public function select_user_account()
    {
        $qry = $this->db->query("SELECT * FROM accounts WHERE acc_type != 'student' AND acc_type != 'superadmin'");
        return $qry;
    }

    public function select_account_modal($account_id)
    {
        $qry = $this->db->query("SELECT * FROM accounts WHERE account_id = '$account_id'");
        return $qry;
    }

    public function select_student_for_approval()
    {
        $qry = $this->db->query("SELECT a.*, b.*,c.*, d.* FROM accounts a INNER JOIN course b ON a.course_id=b.course_id INNER JOIN rank d ON d.rank_id = a.rank_id INNER JOIN personal_information c ON c.account_id = a.account_id WHERE a.approval='no'");
        return $qry;
    }

    public function select_student($course_type, $class_name)
    {
        $qry = $this->db->query("SELECT a.*, b.*,c.*, d.* FROM accounts a INNER JOIN course b ON a.course_id=b.course_id INNER JOIN rank d ON d.rank_id = a.rank_id INNER JOIN personal_information c ON c.account_id = a.account_id WHERE a.approval='yes' AND b.course_id = '$course_type' AND c.class = '$class_name' AND archive='no'");
        return $qry;
    }

    public function select_student_archive($course_type, $class_name)
    {
        $qry = $this->db->query("SELECT a.*, b.*,c.*, d.* FROM accounts a INNER JOIN course b ON a.course_id=b.course_id INNER JOIN rank d ON d.rank_id = a.rank_id INNER JOIN personal_information c ON c.account_id = a.account_id WHERE a.approval='yes' AND b.course_id = '$course_type' AND c.class = '$class_name' AND archive='yes'");
        return $qry;
    }


    public function select_student_for_archive($course_type, $class_name)
    {
        $qry = $this->db->query("SELECT a.*, b.*,c.*, d.* FROM accounts a INNER JOIN course b ON a.course_id=b.course_id INNER JOIN rank d ON d.rank_id = a.rank_id INNER JOIN personal_information c ON c.account_id = a.account_id WHERE a.course_id = '$course_type' AND c.class = '$class_name'");
        return $qry;
    }

    public function archive_student($id)
    {
        $qry = $this->db->query("UPDATE accounts SET archive = 'yes' WHERE account_id = '$id'");
        return TRUE;
    }

    public function select_mod($id){
        $qry = $this->db->query("SELECT * FROM module WHERE course_id='$id'");
        return $qry;
    }

    public function select_sub($id){
        $qry = $this->db->query("SELECT * FROM subjects WHERE mod_id='$id'");
        return $qry;
    }

     public function select_all_where($table,$column,$id){
        $qry = $this->db->query("SELECT * FROM $table WHERE $column=$id");
        return $qry;
    }

    public function select_all_where3($table){
        $qry = $this->db->query("SELECT * FROM $table order by news_id DESC LIMIT 5");
        return $qry;
    }

    public function select_course_class($id){
         $qry = $this->db->query("SELECT DISTINCT(a.class) FROM personal_information a left join accounts b ON a.account_id=b.account_id WHERE course_id=$id AND b.archive='no' AND b.approval ='yes'");
         return $qry;

    }

    public function select_course_class_archived($id){
         $qry = $this->db->query("SELECT DISTINCT(a.class) FROM personal_information a left join accounts b ON a.account_id=b.account_id WHERE course_id=$id AND b.archive='yes'");
         return $qry;

    }

     public function select_all_where2($table,$column,$id,$column2,$id2){
        $qry = $this->db->query("SELECT * FROM $table WHERE $column=$id AND $column2=$id2");
        return $qry;
    }

    public function studs_per_course($id){
        $qry = $this->db->query("SELECT a.name, a.account_id, b.class, b.company, c.rank FROM accounts a LEFT JOIN personal_information b on a.account_id=b.account_id LEFT JOIN rank c ON a.rank_id=c.rank_id WHERE a.course_id=$id");
        return $qry;
    }

     public function studs_per_course2($course_id,$class){
        $qry = $this->db->query("SELECT a.name, a.account_id, b.class, b.company, c.rank FROM accounts a LEFT JOIN personal_information b on a.account_id=b.account_id LEFT JOIN rank c ON a.rank_id=c.rank_id WHERE a.course_id=$course_id and b.class='$class'");
        return $qry;
    }

    public function test_questions($subj_id,$items){
        $qry = $this->db->query("SELECT a.*, b.* FROM test_quest a LEFT JOIN subject b ON a.subj_id=b.subj_id WHERE a.subj_id=$subj_id ORDER BY RAND() LIMIT $items");
        return $qry;
    }

    public function count_module_item($id){
        $qry=$this->db->query("SELECT a.subject_id as count FROM quiz a LEFT JOIN subjects b on a.subject_id=b.subject_id LEFT JOIN module c on b.mod_id=c.mod_id WHERE c.mod_id=$id");
        $rows=$qry->num_rows();
        return $rows;
    }

      public function select_all_group($table,$group_id)
    {
        $this->db->from($table);
        $this->db->group_by($group_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function select_row_where_order_by($table, $whr_clm, $whr_val, $column, $order)
    {
        $this->db->where($whr_clm, $whr_val);
        $this->db->order_by($column, $order);
        $query = $this->db->get($table);
        return $query->result();
    }


      public function select_all_column($column,$table)
    {
        $this->db->select($column);
        $query = $this->db->get($table);
        return $query->result();
        
    }

     public function select_all_order_by($table, $column, $order)
    {
        $this->db->order_by($column, $order);
        $query = $this->db->get($table);
        return $query->result();

    }

    public function select_row_where($table, $whr_clm, $whr_val)
    {
        $this->db->where($whr_clm, $whr_val);
        $query = $this->db->get($table);
        return $query;
    }

    

    public function select_column_where($table, $column, $whr_clm, $whr_val)
    {
        $this->db->select($column);
        $this->db->from($table);
        $this->db->where($whr_clm, $whr_val);
        $query = $this->db->get();
        foreach($query->result() as $result){
            return $result->$column;
        }
    }

    public function select_column_custom_where($table, $column, $where)
    {
        $this->db->select($column);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        foreach($query->result() as $result){
            return $result->$column;
        }
    }

    public function select_custom_where($table, $where)
    {
        $this->db->where($where);
        $query = $this->db->get($table);
        return $query->result();
    }

    public function select_ave_like($table, $column, $where_col, $where_value)
    {
        $this->db->select('AVG('.$column.') as ave');
        $this->db->from($table);
        $this->db->where($where_col . " LIKE '%".$where_value."%'");
        $query = $this->db->get();
        foreach($query->result() as $result)
        {
            return $result->ave;
        }
    }


    public function select_ave_where($table, $column, $where)
    {
        $this->db->select('AVG('.$column.') as ave');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        foreach($query->result() as $result)
        {
            return $result->ave;
        }
    }

    public function select_join_where($table1,$table2, $where,$group_id){
        $this->db->select($table1.'.*');
        $this->db->from($table1);
        $this->db->join($table2, $table1.'.'.$group_id .' = '.$table2.'.'.$group_id, 'left');
        $this->db->where($where);
        $this->db->group_by($table1.'.'.$group_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_max($table, $column){
         $this->db->select_max($column);
         $this->db->from($table);
         $query = $this->db->get();
         foreach($query->result() as $result){
            return $result->$column;
        }

    }

    public function get_max_where($table, $column,$where){
         $this->db->select_max($column);
         $this->db->from($table);
         $this->db->where($where);
         $query = $this->db->get();
         foreach($query->result() as $result){
            return $result->$column;
        }

    }

    public function count_rows($table)
    {
        $this->db->from($table);
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }

     public function count_custom_where($table,$where)
    {
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }

    public function count_distinct($column, $table, $where){
        $this->db->distinct();
        $this->db->select($column);
         $this->db->from($table);
        $this->db->where($where); 
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }

    public function count_quiz($table,$column,$id){
        $this->db->where($column,$id);
        return $this->db->count_all_results($table);
    }
    public function insert_into($table, $data)
    {
        $this->db->trans_begin();
        $this->db->insert($table, $data);
        $id=$this->db->insert_id();

        if($this->db->trans_status() === FALSE){
            $this->db->trans_rollback();
            return 0;
        }else{
            $this->db->trans_commit();
            return $id;
        }
    }

    public function count_rows_where($table,$column,$value)
    {
        $this->db->from($table);
        $this->db->where($column,$value);
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }


    public function count_custom($q)
    {
        $query = $this->db->query($q);
        $rows=$query->num_rows();
        return $rows;
    }

    
    public function select_sum($table, $column, $where_col, $where_value)
    {
        $this->db->select('SUM('.$column.') as total');
        $this->db->from($table);
        $this->db->where($where_col, $where_value);
        $query = $this->db->get();
        foreach($query->result() as $result)
        {
            return $result->total;
        }
    }

    public function select_sum_where($table, $column, $where)
    {
        $this->db->select('SUM('.$column.') as total');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        foreach($query->result() as $result)
        {
            return $result->total;
        }
    }

    public function custom_query($q){
        $query = $this->db->query($q);
         return $query->result();
    }

   public function custom_query_single($column,$q){
        $query = $this->db->query($q);
          foreach($query->result() as $result){
            return $result->$column;
        }
    }

    public function update_where($table, $data, $column, $value)
    {
        $this->db->trans_begin();
        $this->db->where($column, $value);
        $this->db->update($table, $data);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return 0;
        } else {
            $this->db->trans_commit();
            return 1;
        }
    }

     public function update_custom_where($table, $data, $where)
    {
        $this->db->trans_begin();
        $this->db->where($where);
        $this->db->update($table, $data);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return 0;
        } else {
            $this->db->trans_commit();
            return 1;
        }
    }

    public function delete_where($table, $column, $value)
    {
        $this->db->trans_begin();
        $this->db->where($column, $value);
        $this->db->delete($table);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return 0;
        } else {
            $this->db->trans_commit();
            return 1;
        }
    }

    function delete_data($id)
    {
       $this->db->delete('items', array('item_id' => $id)); 
       $this->db->delete('supplier_items', array('item_id' => $id));
       if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return 0;
        } else {
            $this->db->trans_commit();
            return 1;
        }
    }
    
    public function login_user($username){
        $this->db->select('*');
        $this->db->from('account');
        $this->db->where("accnt_user='$username'");
        $query=$this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }

    /*public function login_register($email, $password){
        $this->db->select('*');
        $this->db->from('registration');
        $this->db->where("email='$email' AND (password = '$password' OR password = '".md5($password)."')");
        $query=$this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }*/

      public function select_count_join_inner($table1,$table2, $where,$group_id)
    {
        
        $this->db->from($table1);
        $this->db->join($table2, $table1.'.'.$group_id .' = '.$table2.'.'.$group_id);
        $this->db->where($where);
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }


       public function count_join_where($table1,$table2, $where,$group_id)
    {
        $this->db->from($table1);
        $this->db->join($table2, $table1.'.'.$group_id .' = '.$table2.'.'.$group_id, 'left');
        $this->db->where($where);
        $this->db->group_by($table1.'.'.$group_id);
        $query = $this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }

     public function select_join_where_order($table1,$table2, $where,$group_id, $column, $order)
    {
        $this->db->select($table1.'.*');
        $this->db->from($table1);
        $this->db->join($table2, $table1.'.'.$group_id .' = '.$table2.'.'.$group_id, 'left');
        $this->db->where($where);
        $this->db->group_by($table1.'.'.$group_id);
        $this->db->order_by($column, $order);
        $query = $this->db->get();
        return $query->result();
    }

    /*public function login_user($username, $password){
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where("username='$username' AND (password = '$password')");
        $query=$this->db->get();
        $rows=$query->num_rows();
        return $rows;
    }*/
}
