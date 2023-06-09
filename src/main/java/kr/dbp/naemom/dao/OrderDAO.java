package kr.dbp.naemom.dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.Order_listVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Reservated_optionVO;
import kr.dbp.naemom.vo.Reservation_roomVO;
import kr.dbp.naemom.vo.Shopping_basketVO;
import kr.dbp.naemom.vo.Use_memberVO;

public interface OrderDAO {

	ProductVO selectProduct(@Param("pd_num")int pd_num);

	ArrayList<Option_landMarkVO> selectTravelOption(@Param("pd_num")int pd_num);

	ArrayList<Option_restrauntVO> selectFoodOption(@Param("pd_num")int pd_num);

	ArrayList<Option_accomodationVO> selectHomeOption(@Param("pd_num")int pd_num);

	ArrayList<Option_festivalVO> selectFestivalOption(@Param("pd_num")int pd_num);

	FileVO selectFileByPdNum(@Param("fi_table_key")int pd_num, @Param("fi_category")String fi_category, @Param("fi_table")String fi_table);

	int insertBasket(@Param("tmp")OptionListDTO tmp,@Param("me_id")String me_id);

	ArrayList<Shopping_basketVO> selectBasket(@Param("me_id")String me_id);

	int deleteBasket(@Param("sb_num")int sb_num, @Param("me_id")String me_id);

	int deleteAllBasket(@Param("me_id")String me_id);

	Shopping_basketVO selectBasketBySbNum(@Param("me_id")String me_id, @Param("sb_num")int num);

	

	void insertBuyList(@Param("bl")Buy_listVO bl);

	void insertOrderList(@Param("sb_num")String tmp, @Param("bl_num")String bl_num);

	int updateBuyList(@Param("bl_num")String bl_num, @Param("me_id")String me_id, @Param("state")String state);

	int deleteOrderList(@Param("bl_num")String bl_num);

	int deleteBuyList(@Param("bl_num")String bl_num, @Param("me_id")String me_id);

	Buy_listVO selectBuyListByBlNum(@Param("bl_num")String bl_num);

	int insertUseMember(@Param("um")Use_memberVO useMember);

	int insertMileage(@Param("bl")Buy_listVO bl, @Param("mi_update")int mi_update);

	void updateMemberByMileage(@Param("bl")Buy_listVO bl, @Param("mi_update")int mi_update);

	ArrayList<Reservated_optionVO> selectFood(@Param("ro")Reservated_optionVO ro, @Param("me_id")String me_id);

	int updateBasket(@Param("tmp")OptionListDTO tmp, @Param("me_id")String me_id);

	ArrayList<Shopping_basketVO> selectBasketById(@Param("me_id")String me_id);

	Shopping_basketVO selectBasketAndPdNum(@Param("sb_num")int sb_num, @Param("me_id")String me_id);

	DayOFFVO selectDayOff(@Param("pd_num")int pd_num);

	Option_restrauntVO selectFoodOptionByTableKey(@Param("ol_table_key")int ol_table_key);

	Option_accomodationVO selectHomeOptionByTableKey(@Param("ol_table_key")int ol_table_key);

	void insertFoodOption(@Param("tmp")Order_listVO tmp, @Param("food")Option_restrauntVO food, 
			@Param("me_id")String me_id,@Param("bl_num")String bl_num);

	void insertHomeOption(@Param("tmp")Order_listVO tmp, @Param("home")Option_accomodationVO home,
			@Param("me_id")String me_id,  @Param("date")LocalDate date, @Param("bl_num")String bl_num);

	Reservation_roomVO selectReservRoom(@Param("ao_num")int ao_num, @Param("checkIn")LocalDate date,
			@Param("checkOut")String string);

	int selectReservFood(@Param("pd_num")int reo_pd_num, @Param("date")String sb_date, @Param("time")int sb_time);

	int selectBasketCheck(@Param("item")Shopping_basketVO item, @Param("pd_num")int pd_num);

	void updateBuyListByReceipt(@Param("bl_num")String bl_num, @Param("receipt_id")String receipt_id);

	




}
