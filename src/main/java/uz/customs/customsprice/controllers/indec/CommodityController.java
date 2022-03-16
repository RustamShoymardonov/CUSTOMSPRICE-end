package uz.customs.customsprice.controllers.indec;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customsprice.entity.InitialDecision.*;
import uz.customs.customsprice.entity.files.Docs;
import uz.customs.customsprice.service.*;
import uz.customs.customsprice.utils.Utils;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
    private final CommodityService commodityService;
    private final AppsService appsservice;
    private final RollbackSpService rollbackSpService;
    private final DocsService docsService;

    private final String INITIALDECISIONVIEWCMDT = "/resources/pages/InitialDecision/InitialDecisionSteps/Steps";

    public CommodityController(CommodityService commodityService, AppsService appsservice, RollbackSpService rollbackSpService, DocsService docsService) {
        this.commodityService = commodityService;
        this.appsservice = appsservice;
        this.rollbackSpService = rollbackSpService;
        this.docsService = docsService;
    }


    @PostMapping(value = INITIALDECISIONVIEWCMDT)
    @ResponseBody
    public ModelAndView InitialDecisionViewCmdt(HttpSession session, @RequestParam String cmdt_id, @RequestParam Integer x, @RequestParam String appId) {
        ModelAndView mav = new ModelAndView();
        ModelAndView mav1 = new ModelAndView("resources/pages/InitialDecision/InitialDecisionSteps/Steps1");
        ModelAndView mav2 = new ModelAndView("resources/pages/InitialDecision/InitialDecisionSteps/Steps2");
        ModelAndView mav3 = new ModelAndView("resources/pages/InitialDecision/InitialDecisionSteps/Steps3");
        ModelAndView mav4 = new ModelAndView("resources/pages/InitialDecision/InitialDecisionSteps/Steps4");
        String COMMODITY_ID = Utils.nullClear(String.valueOf(session.getAttribute("COMMODITY_ID")));
        String APPLICATION_ID = Utils.nullClear(String.valueOf(session.getAttribute("APPLICATION_ID")));
        switch (x) {
            case 1:
                mav1.addObject("commodityF", new Commodity());
                List<Commodity> commodityList = appsservice.getCommodityList(cmdt_id);
                if (commodityList.size() > 0)
                    mav1.addObject("commodity", commodityList);
                else
                    mav1.addObject("commodity", "0");
                session.setAttribute("COMMODITY_ID", commodityList.get(0).getId());
                session.setAttribute("APPLICATION_ID", commodityList.get(0).getAppId());
                mav = mav1;
                break;
            case 2:
                List<Commodity> commodityList2 = appsservice.getCommodityList(COMMODITY_ID);
                mav2.addObject("commodity", commodityList2);
                mav = mav2;
                break;
            case 3:

//                List<Commodity> commodityList3 = appsservice.getCommodityList(COMMODITY_ID);
//                mav3.addObject("commodity", commodityList3);
//                mav = mav3;

                List<Docs> docsList = appsservice.getDocsListAppId(APPLICATION_ID);
                mav3.addObject("docsList", docsList);
                mav = mav3;
                break;

            case 4:
//                mav4.addObject("commodity", COMMODITY_ID);
//                mav = mav4;

                List<RollbackSp> listRollbackSp = rollbackSpService.getlistRollbackSp();
                mav4.addObject("rollbackInfo", listRollbackSp);
                mav = mav4;

                break;
            default:
        }
        return mav;
    }
}
