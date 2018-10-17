package com.flf.controller;



import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Activity;
import com.flf.entity.ActivityClass;
import com.flf.entity.Area;
import com.flf.entity.Assessment;
import com.flf.entity.Banner;
import com.flf.entity.Base;
import com.flf.entity.Dynamic;
import com.flf.entity.EntreGroup;
import com.flf.entity.Industry;
import com.flf.entity.News;
import com.flf.entity.Note;
import com.flf.entity.Policy;
import com.flf.entity.PolicyClassfication;
import com.flf.entity.QrCode;
import com.flf.entity.State;
import com.flf.interceptor.RequestLimit;
import com.flf.service.ActivityClassService;
import com.flf.service.ActivityService;
import com.flf.service.AreaService;
import com.flf.service.AssessmentService;
import com.flf.service.BannerService;
import com.flf.service.BaseService;
import com.flf.service.DynamicService;
import com.flf.service.EntreGroupService;
import com.flf.service.IndustryService;
import com.flf.service.NewsService;
import com.flf.service.NoteService;
import com.flf.service.PolicyClassficationService;
import com.flf.service.PolicyService;
import com.flf.service.QrCodeService;
import com.flf.service.StateService;
import com.flf.util.Const;
import com.flf.util.Tools;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/front")
public class IndexController {
	private Map<Integer,Integer> policyViewCount=new HashMap<Integer,Integer>();
	private Map<Integer,Integer> dtxqViewCount=new HashMap<Integer,Integer>();
	@Autowired
	private DynamicService dynamicService;
	@Autowired
	private QrCodeService qrCodeService;
	@Autowired
	private BannerService bannerService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private AreaService areaSrvice;
	@Autowired
	private PolicyService policyService;
	@Autowired
	private NoteService noteService;
	@Autowired
	private StateService stateService;
	@Autowired
	private AssessmentService assessmentService;
	@Autowired
	private ActivityClassService activityClassService;
	@Autowired
	private BaseService baseService;
	@Autowired
	private PolicyClassficationService policyClassficationService;
	@Autowired
	private EntreGroupService entreGroupService;
	@Autowired
	private IndustryService industryService;
	
	/**
	 * 请求新增用户页面
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/home")
	public ModelAndView home(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		Integer dynamicCount=dynamicService.getDynamicCount();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		for (int i = 0; i < qrCodes.size(); i++) {
			System.out.println(qrCodes.get(i).toString());
		}
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		mv.addObject("dynamicCount",dynamicCount);
		mv.setViewName("front/home");
		return mv;
	}
	/**
	 * 刷新首页轮播动态
	 * @return
	 */
	@RequestMapping(value="/homeajax")
	@ResponseBody
	public List<Dynamic> addDttoHomePage(){
		System.out.println("frontpagedt");
		Dynamic dy = new Dynamic();
		List<Dynamic> dtList=dynamicService.listPageDynamic(dy);
		System.out.println(dtList.size());
		return dtList;
	}
	/**
	 * 刷新首页部委动态
	 * @return
	 */
	@RequestMapping(value="/homeajax1")
	@ResponseBody
	public List<Dynamic> addBuweiDttoHomePage(){
		System.out.println("buwei");
		List<Dynamic> dtList=dynamicService.getBuWeiDyList();
		if(dtList!=null) {
			if(dtList.size()>2) {
				return dtList.subList(0, 2);
			}
		}
		return dtList;
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/homeajax2")
	@ResponseBody
	public Banner addShouluDttoHomePage(){
		System.out.println("shoulu");
		List<Banner> bList=bannerService.listPageBanner(new Banner());
		if(bList!=null) {
			return bList.get(0);	
		}
		return null;
	}
	/**
	 * 刷新首页地方动态
	 * @return
	 */
	@RequestMapping(value="/homeajax3")
	@ResponseBody
	public List<Dynamic> addDifangDttoHomePage(){
		List<Dynamic> dtList=dynamicService.getDiFangDyList();
		if(dtList!=null) {
			if(dtList.size()>4) {
				return dtList.subList(0, 4);
			}
		}
		return dtList;
	}
	/**
	 * 刷新首页社会团体动态
	 * @return
	 */
	@RequestMapping(value="/homeajax4")
	@ResponseBody
	public List<Dynamic> addSHTTDttoHomePage(){
		List<Dynamic> dtList=dynamicService.getSHTTDyList();
		if(dtList!=null) {
			if(dtList.size()>4) {
				return dtList.subList(0, 4);
			}
		}
		return dtList;
	}
	/**
	 * 刷新基地动态
	 * @return
	 */
	@RequestMapping(value="/homeajax5")
	@ResponseBody
	public List<Dynamic> addJidiDttoHomePage(){
		List<Dynamic> dtList=dynamicService.getJidiDyList();
		if(dtList!=null) {
			if(dtList.size()>4) {
				return dtList.subList(0, 4);
			}
		}
		return dtList;
	}
	/**
	 * 刷新专题专栏(左侧)
	 * @return
	 */
	@RequestMapping(value="/homeajax6")
	@ResponseBody
	public List<News> addZhuanti1(){
		List<News> nList=newsService.getQCG();
		if(nList!=null) {
			if(nList.size()>3)
				return nList.subList(0, 3);
		}
		return nList;
	}
	/**
	 * 刷新专题专栏(右侧)
	 * @return
	 */
	@RequestMapping(value="/homeajax7")
	@ResponseBody
	public List<News> addZhuanti2(){
		List<News> nList=newsService.getZXX();
		if(nList!=null) {
			if(nList.size()>3)
				return nList.subList(0, 3);
		}
		return nList;
	}
	/**
	 * 刷新首页 最新政策 部委政策
	 * @return
	 */
	@RequestMapping(value="/homeajax8")
	@ResponseBody
	public List<Policy> addBuWeiZC(){
		List<Policy> pList=policyService.listPageBuWeiPolicy(new Policy());
		if(pList!=null) {
			if(pList.size()>2)
				return pList.subList(0, 2);
		}
		return pList;
	}
	/**
	 * 刷新首页 最新政策 地方政策
	 * @return
	 */
	@RequestMapping(value="/homeajax9")
	@ResponseBody
	public List<Policy> addDifangZC(){
		List<Policy> pList=policyService.listPageDifangPolicy(new Policy());
		if(pList!=null) {
			if(pList.size()>2)
				return pList.subList(0, 2);
		}
		for(Policy p:pList) {
			System.out.println(p.toString());
		}
		return pList;
	}
	/**
	 * 刷新首页 政策分析
	 * @return
	 */
	@RequestMapping(value="/homeajax10")
	@ResponseBody
	public List<Policy> addHotZC(){
		List<Policy> pList=policyService.listPagePolicyOrderByPageView(new Policy());
		if(pList!=null) {
			if(pList.size()>5)
				return pList.subList(0, 5);
		}
		return pList;
	}
	/**
	 * 刷新双创周数据 活动类型主会场和分会场 类型代码0 和1 最多送五条数据给前端
	 * @return
	 */
	@RequestMapping(value="/homeajax11")
	@ResponseBody
	public List<Activity> addSCZ(Integer limit){
		Activity a = new Activity();
		List<Activity> acList=activityService.listPageSCZ(a);
		if(acList!=null) {
			if(acList.size()>limit) {
				return acList.subList(0, limit);
			}
		}
		return acList;
	}
	/**
	 * 刷新创响中国活动数据 活动类型创响中国
	 * @return
	 */
	@RequestMapping(value="/homeajax12")
	@ResponseBody
	public List<Activity> addCXZG(Integer limit){
		Activity a = new Activity();
		a.setaType(3);
		List<Activity> acList=activityService.listPageActivity(a);
		if(acList!=null) {
			if(acList.size()>limit) {
				return acList.subList(0, limit);
			}
		}
		return acList;
	}
	/**
	 * 动态列表 dongTaiList.html 
	 * @return
	 */
	@RequestMapping(value="/dongTaiList")
	public ModelAndView getDongTaiList() {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		mv.setViewName("front/dongTaiList");
		return mv;
	}
	/**
	 * 动态详情 顶部按钮 地区
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/dtlarea")
	@ResponseBody
	public void getAreaList(HttpServletResponse response) throws IOException {
		List<Area> aList=areaSrvice.getAreaList();
		JSONArray jsonArray=JSONArray.fromObject(aList);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 全部动态
	 * @param dynamic
	 * @return
	 */
	@RequestMapping(value="/dtlajax1")
	@ResponseBody
	public List<Dynamic> getAllDongTai(){
		List<Dynamic> dynamics=dynamicService.getAllDyList();
		return dynamics;
	}
	/**
	 * 部委动态 地方动态 基地动态 社会团体
	 */
	@RequestMapping(value="/dtlajax2")
	@ResponseBody
	public List<Dynamic> getDifferentDongTai(Integer issuer,Integer area,Integer base,Integer caste){
		System.out.println(issuer);
		System.out.println(area);
		System.out.println(base);
		System.out.println(caste);
		Dynamic dynamic = new Dynamic();
		dynamic.setDyIssuer(issuer);
		dynamic.setDyArea(area);
		dynamic.setDyBase(base);
		dynamic.setDyCaste(caste);
		List<Dynamic> dynamics=dynamicService.getDyList(dynamic);
		return dynamics;
	}
	/**
	 * 动态详情 
	 * @param id
	 * @return
	 */
	
	@RequestMapping(value="/dtxq")
	public ModelAndView getDtxqPage(@RequestParam("id") Integer id,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Dynamic dtxq=dynamicService.getDynamicById(id);
		mv.setViewName("front/dtxq");
		mv.addObject("dtxq", dtxq);
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		int count=dtxqViewCount.containsKey(id)? dtxqViewCount.get(id):0;
		dtxqViewCount.put(id, count+1);
		mv.addObject("addcount", dtxqViewCount.get(id)+dtxq.getDyPageView());
		//dynamicService.updatePageView(id);
		return mv;
	}
	/**
	 * 全面创新改革试验详情 qcgxq.html?id=
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/qcgxq")
	public ModelAndView getQcgxqPage(@RequestParam("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		News qcgxq=newsService.getNewsById(id);
		newsService.updatePageView(id);
		mv.setViewName("front/qcgxq");
		mv.addObject("qcgxq", qcgxq);
		
		return mv;
	}
	/**
	 * 战略性新兴产业详情 zxxxq.html?id=
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/zxxxq")
	public ModelAndView getZxxxqPage(@RequestParam("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		News zxxxq=newsService.getNewsById(id);
		newsService.updatePageView(id);
		mv.setViewName("front/zxxxq");
		mv.addObject("zxxxq",zxxxq);
		return mv;
	}
	/**
	 * 双创周详情 sczxq.html?id=
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/sczxq")
	public ModelAndView getSczxqPage(@RequestParam("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		Activity sczxq=activityService.getActivityById(id);
		newsService.updatePageView(id);
		mv.setViewName("front/sczxq");
		mv.addObject("sczxq",sczxq);
		activityService.updatePageView(id);
		return mv;
	}
	/**
	 * 创响中国详情 cxzgxq.html?id=
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/cxzgxq")
	public ModelAndView getCxzgxqPage(@RequestParam("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		Activity cxzgxq=activityService.getActivityById(id);
		newsService.updatePageView(id);
		mv.setViewName("front/cxzgxq");
		mv.addObject("cxzgxq",cxzgxq);
		activityService.updatePageView(id);
		return mv;
	}
	/**
	 * 政策库 policyKu.html
	 * @return
	 */
	@RequestMapping(value="/policyKu")
	public ModelAndView getPolicyKuPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/policyKu");
		addQrCode(mv);
		return mv;
	}
	/**
	 * 政策库(政策动态) 顶部三动态
	 * @param response
	 * @param limit
	 * @throws IOException
	 */
	@RequestMapping(value="/policyKuAjax1")
	@ResponseBody
	public void getPolicyDynamicTops(HttpServletResponse response,Integer limit) throws IOException {
		/*List<Dynamic> dynamics=dynamicService.get*/
		Dynamic dy = new Dynamic();
		dy.setDyArea(0);
		dy.setDyCaste(0);
		dy.setDyIssuer(0);
		dy.setDyType(1);
		List<Dynamic> dynamics=dynamicService.getDyList(dy);
		JSONArray jsonArray = new JSONArray();
		if(dynamics!=null) {
			jsonArray.add(dynamics.subList(0, dynamics.size()>limit? limit:dynamics.size()));
		}else {
			jsonArray.add(dynamics);
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策库(政策动态) 底部动态(可查询)
	 * @param response
	 * @param category
	 * @param pageNum
	 * @param pageSize
	 * @param area
	 * @param basesActivityFlag
	 * @param pubDeptFlag
	 * @throws IOException
	 */
	@RequestMapping(value="/policyKuAjax2")
	@ResponseBody
	public void getDynamicListByAll(HttpServletResponse response,Integer category,Integer pageNum,Integer pageSize,Integer area,Integer basesActivityFlag,Integer pubDeptFlag) throws IOException {
		Dynamic dy = new Dynamic();
		System.out.println("category:"+category);
		System.out.println("basesActivityFlag:"+basesActivityFlag);
		System.out.println("pubDeptFlag:"+pubDeptFlag);
		System.out.println("area:"+area);
		dy.setDyType(category);
		dy.setDyArea(area);
		dy.setDyIssuer(pubDeptFlag);
		dy.setDyBase(basesActivityFlag);
		List<Dynamic> dynamics=dynamicService.getDyList(dy);
		JSONArray jsonArray = new JSONArray();
		Integer counts=0;
		if(dynamics!=null) {
			counts=dynamics.size();
		}
		System.out.println("counts:"+counts);
		jsonArray.add(counts);
		if(counts>pageNum*pageSize) {
			jsonArray.add(dynamics.subList((pageNum-1)*pageSize, pageNum*pageSize));
		}else {
			jsonArray.add(dynamics.subList((pageNum-1)*pageSize, counts));
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策查询  响应请求 zhengceku.html 返回页面
	 * @return
	 */
	@RequestMapping(value="/zhengceku")
	public ModelAndView getZhengcekuPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/zhengceku");
		return mv;
	}
	/**获取参数 往政策查询页面(zhengceku.html) 刷新数据
	 * pageNum pageSize timeStageId areaFlagId areaId zoneId businessPeopleId startDate endDate
	 * industryId unitName issuedno
	 * @param data
	 * @throws IOException 
	 */
	@RequestMapping(value="/zhengcekuAjax1")
	@ResponseBody
	public void getPolicy(HttpServletResponse response,Integer pageNum,Integer pageSize,Integer timeStageId,Integer areaFlagId,
			String area,String zone,String businessPeople,Date startDate,Date endDate,
			String industry,String unitName,String issuedno) throws IOException {
		if(area.equals("发布地区")) {
			area="";
		}
		if(zone.equals("政策分类")) {
			zone="";
		}
		if(businessPeople.equals("使用人群")) {
			businessPeople="";
		}
		if(industry.equals("不限")) {
			industry="";
		}
		System.out.println("zhengcekuAjax1");
		System.out.println("areaFlagId:"+areaFlagId);
		System.out.println("area:"+area);
		System.out.println("zone:"+zone);
		System.out.println("timeStageId:"+timeStageId);
		System.out.println("businessPeople:"+businessPeople);
		System.out.println("startDate:"+startDate);
		System.out.println("endDate:"+endDate);
		System.out.println("industry:"+industry);
		System.out.println("unitName:"+unitName);
		System.out.println("issuedno:"+issuedno);
		Policy policy = new Policy();
		JSONArray jsonArray = new JSONArray();
		policy.setpArea(area);
		policy.setpClassfication(zone);
		policy.setpEntreGroup(businessPeople);
		policy.setpIssueOrg(unitName);
		policy.setpIndustry(industry);
		policy.setpIndex(issuedno);
		policy.setSearchStart(startDate);
		policy.setSearchEnd(endDate);
		List<Policy> policies=policyService.getPolicyList(policy);
		Integer counts=0;
		if(policies!=null) {
			counts=policies.size();
		}
		jsonArray.add(counts);
		System.out.println("policycounts:"+counts);
		if(counts>pageNum*pageSize) {
			jsonArray.add(policies.subList((pageNum-1)*pageSize, pageNum*pageSize));
		}else {
			jsonArray.add(policies.subList((pageNum-1)*pageSize, counts));
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策查询 高级搜索
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/zhengcekuAjax2")
	@ResponseBody
	public void getPolicySearchChoice(HttpServletResponse response) throws IOException {
		JSONArray jsonArray = new JSONArray();
		List<Area> aList=areaSrvice.getAreaList();
		jsonArray.add(aList);
		List<PolicyClassfication> policyClassfications=policyClassficationService.getPCList();
		jsonArray.add(policyClassfications);
		List<EntreGroup> entreGroups=entreGroupService.getEGList();
		jsonArray.add(entreGroups);
		List<Industry> industries=industryService.getIndustryList();
		jsonArray.add(industries);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策查询 文字搜索
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param keyword
	 * @throws IOException
	 */
	@RequestMapping(value="/zhengcekuAjax3")
	@ResponseBody
	public void searchPolicyByKeyword(HttpServletResponse response,Integer pageNum,Integer pageSize,String keyword) throws IOException {
		JSONArray jsonArray = new JSONArray();
		List<Policy> policies=policyService.searchPolicy(keyword);
		Integer counts=0;
		if(policies!=null) {
			counts=policies.size();
		}
		jsonArray.add(counts);
		System.out.println("policycounts:"+counts);
		if(counts>pageNum*pageSize) {
			jsonArray.add(policies.subList((pageNum-1)*pageSize, pageNum*pageSize));
		}else {
			jsonArray.add(policies.subList((pageNum-1)*pageSize, counts));
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策分析 analyzeMap.html
	 * @return
	 */
	@RequestMapping(value="/analyzeMap")
	public ModelAndView getAnalyzeMapPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/analyzeMap");
		addQrCode(mv);
		return mv;
	}
	/**
	 * 政策分析 年度 季度 月度 周度最火政策刷新
	 * @param response
	 * @param type
	 * @param limit
	 * @throws IOException
	 */
	@RequestMapping(value="/analyzeMapAjax1")
	@ResponseBody
	public void getHotsByCycle(HttpServletResponse response,int type,int limit) throws IOException {
		JSONArray jsonArray = new JSONArray();
		List<Policy> pList=policyService.getHotsByCycle(type);
		int counts=0;
		if(pList!=null) {
			counts=pList.size();
		}
		jsonArray.add(counts);
		jsonArray.add(pList.subList(0, counts>limit? limit:counts));
		System.out.println("gethot counts:"+counts);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 政策详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/zhengcekuDetail")
	public ModelAndView getzhengcekuDetailPage(@RequestParam("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
		Policy policy=policyService.getPolicyById(id);
		mv.setViewName("front/zhengcekuDetail");
		mv.addObject("policy",policy);
		int count= policyViewCount.containsKey(id)? policyViewCount.get(id):0;
		policyViewCount.put(id, count+1);
		mv.addObject("count", count+policy.getPageView()+1);
		return mv;
	}
	/**
	 * 基地动态 baseExp.html
	 * @return
	 */
	@RequestMapping(value="/baseExp")
	public ModelAndView getBaseExpPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/baseExp");
		addQrCode(mv);
		return mv;
	}
	/**
	 * 基地动态  轮播三动态
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/baseExpAjax1")
	@ResponseBody
	public List<Dynamic> getBannerBase(Integer limit){
		List<Dynamic> dynamics=dynamicService.getJidiDyList();
		System.out.println("limit:"+limit);
		if(dynamics!=null) {
			if(dynamics.size()>limit) {
				System.out.println("split");
				return dynamics.subList(0, limit);
			}
		}
		return dynamics;
	}
	/**
	 * 基地动态 最新动态  可选择批次batch 类型 type
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param type
	 * @param batch
	 * @throws IOException
	 */
	@RequestMapping(value="/baseExpAjax2")
	@ResponseBody
	public void getDtListtoBaseExp(HttpServletResponse response,Integer pageNum,Integer pageSize,Integer type,Integer batch) throws IOException{
		JSONArray jsonArray = new JSONArray();
		System.out.println("pageNum:"+pageNum);
		System.out.println("type:"+type);
		System.out.println("batch:"+batch);
		Base base=new Base();
		base.setbBatch(batch);
		base.setbType(type);
		System.out.println(base.getbBatch());
		System.out.println(base.getbType());
		List<Dynamic> dynamics=dynamicService.getDylistToBaseExpPage(base);
		Integer counts=0;
		if(dynamics!=null) {
			counts=dynamics.size();
		}
		jsonArray.add(counts);
		if(counts>pageNum*pageSize) {
			jsonArray.add(dynamics.subList((pageNum-1)*pageSize, pageNum*pageSize));
		}else {
			jsonArray.add(dynamics.subList((pageNum-1)*pageSize, counts));
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 基地库 jidiku.html
	 * @return
	 */
	@RequestMapping(value="/jidiku")
	public ModelAndView getJidikuPage() {
		ModelAndView mv = new ModelAndView();
		addQrCode(mv);
		mv.setViewName("front/jidiku");
		List<Area> areas=areaSrvice.getAreaList();
		mv.addObject("areas", areas);
		return mv;
	}
	/**
	 * 基地库 刷新基地库列表 每个基地数据配合两条(以内)所属动态
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param type
	 * @param batch
	 * @param area
	 * @param name
	 * @throws IOException
	 */
	@RequestMapping(value="/jidikuAjax1")
	@ResponseBody
	public void getBaseListtoJidiku(HttpServletResponse response,Integer pageNum,Integer pageSize,Integer type,Integer batch,Integer area,String name) throws IOException{
		JSONArray jsonArray = new JSONArray();
		System.out.println("pageNum:"+pageNum);
		System.out.println("type:"+type);
		System.out.println("batch:"+batch);
		System.out.println("area:"+area);
		System.out.println("name:"+name);
		Base base=new Base();
		base.setbBatch(batch);
		base.setbType(type);
		base.setbName(name);
		base.setbArea(area);
		System.out.println(base.getbBatch());
		System.out.println(base.getbType());
		List<Base> bases=baseService.getBaseByBatchOrTypeOrAreaOrName(base);
		Integer counts=0;
		List<Object> data = new ArrayList<Object>();
		if(bases!=null) {
			counts=bases.size();
			System.out.println(counts);
			int end= counts>(pageNum*pageSize)? (pageNum*pageSize):counts;
			for(Base b:bases.subList((pageNum-1)*pageSize, end)) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("base", b);
				List<Dynamic> dynamics=dynamicService.getDylistByBase(b.getbId());
				if(dynamics!=null&&dynamics.size()>2) {
					map.put("dynamicList", dynamics.subList(0, 2));
				}else {
					map.put("dynamicList", dynamics);
				}
				data.add(map);
			}
		}
		jsonArray.add(counts);
		jsonArray.add(data);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 活动跟踪 activeAfter.html
	 * @return
	 */
	@RequestMapping(value="/activeAfter")
	public ModelAndView getActiveAfterPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/activeAfter");
		addQrCode(mv);
		return mv;
	}
	/**
	 * 活动跟踪 获取部委 地区 基地 社会团体 的数据
	 * @param response
	 * @param category
	 * @param pageNum
	 * @param pageSize
	 * @throws IOException
	 */
	@RequestMapping(value="/activeAfterAjax1")
	@ResponseBody
	public void getActivityTypeDetailList(HttpServletResponse response,Integer category,Integer pageNum,Integer pageSize) throws IOException {
		//category 0代表部委 1代表地区 2代表基地 3代表社会团体
		//pageNum 代表页数 
		//pageSize 代表每页数据量
		List<ActivityClass> activityClasses=activityClassService.getAcListByType(category);
		JSONArray jsonArray = new JSONArray();
		Integer counts=0;
		if(activityClasses!=null) {
			counts=activityClasses.size();
		}
		jsonArray.add(counts);
		if(counts>pageNum*pageSize) {
			jsonArray.add(activityClasses.subList((pageNum-1)*pageSize, pageNum*pageSize));
		}else {
			jsonArray.add(activityClasses.subList((pageNum-1)*pageSize, counts));
		}
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonArray);
	}
	/**
	 * 服务拓展serviceOver.html
	 * @return
	 */
	@RequestMapping(value="/serviceOver")
	public ModelAndView getServiceOverPage() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("front/serviceOver");
		addQrCode(mv);
		return mv;
	}
	/**
	 * 服务拓展 
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/serviceoverajax1")
	@ResponseBody
	public List<Assessment> getAssessmenttoServiceOverPage(Integer type) {
		Assessment a = new Assessment();
		a.setaType(type);;
		List<Assessment> assessments=assessmentService.listPageAssessment(a);
		if(assessments!=null) {
			if(assessments.size()>3) {
				assessments.subList(0, 3);
			}
		}
		return assessments;
	}
	@RequestMapping(value="/word",method=RequestMethod.GET)
	public ModelAndView getWordPage() {
		System.out.println("word");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("front/word");
		addQrCode(mv);
		Note note=noteService.getNote();
		mv.addObject("note", note);
		return mv;
	}
	@RequestMapping(value="/word",method=RequestMethod.POST)
	public ModelAndView saveWordPage(HttpSession session,@RequestParam String code,State state) {
		System.out.println("saveword");
		ModelAndView mv=new ModelAndView();
		String errInfo = "";
		String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);
		if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)) {
			mv.addObject("msg", "success");
			state.setsTime(new Date());
			stateService.insertState(state);
		}else {
			errInfo = "验证码输入有误！";
			mv.addObject("state", state);
			mv.addObject("errInfo", errInfo);
		}
		mv.setViewName("front/word");
		Note note=noteService.getNote();
		mv.addObject("note", note);
		return mv;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	public void addQrCode(ModelAndView mv) {
		List<QrCode> qrCodes=qrCodeService.listAllQrcode();
		mv.addObject("weixin", qrCodes.get(1));
		mv.addObject("weibo", qrCodes.get(0));
	}
	//spring 4.x后的cron 表达式只用6个字段
	@Scheduled(cron="0 0/5 * * * ?")
	public void changeCount() {
		//每5分钟更新一次数据库
		System.out.println("5min"+new Date().toString());
		changeCountOfDtxq();
		changeCountOfPolicy();
		System.out.println("-------------");
	}
	public void changeCountOfDtxq() {
		Iterator<Map.Entry<Integer, Integer>> entries=dtxqViewCount.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<Integer, Integer> entry=entries.next();
			System.out.println("id="+entry.getKey()+",count="+entry.getValue());
			dynamicService.updatePageView(entry.getKey(), entry.getValue());
		}

		dtxqViewCount=new HashMap<Integer,Integer>();
	}
	public void changeCountOfPolicy() {
		
		Iterator<Map.Entry<Integer, Integer>> entries=policyViewCount.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<Integer, Integer> entry=entries.next();
			System.out.println("id="+entry.getKey()+",count="+entry.getValue());
			policyService.updatePageView(entry.getKey(), entry.getValue());
		}
		
		policyViewCount=new HashMap<Integer,Integer>();
	}
	//每周清理一次政策浏览量 周一的凌晨0点
	@Scheduled(cron="0 0 0 ? * MON")
	public void cleanPolicyPageViewByWeek() {
		policyService.updatePageViewWeek();
	}
	//每月清理一次政策浏览量 每月1号的凌晨0点
	@Scheduled(cron="0 0 0 1 * ? ")
	public void cleanPolicyPageViewByMonth() {
		policyService.updatePageViewMonth();
	}
	//每季清理一次政策浏览量 
	@Scheduled(cron="0 0 0 1 1,4,7,10 ?")
	public void cleanPolicyPageViewBySeason() {
		policyService.updatePageViewSeason();
	}
	//每年清理一次政策浏览量
	@Scheduled(cron="0 0 0 1 * ?")
	public void cleanPolicyPageViewByYear() {
		policyService.updatePageViewYear();
	}
	
}
