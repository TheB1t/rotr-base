#include "\a3\ui_f\hpp\defineCommon.inc"

#define CALC_CTRL_OFFSET(H)		((H) / 10)
#define CALC_CTRL_H(OFF)		((OFF) * 8)

#define GW					40
#define GH					25

#define CT_CONTROLS_TABLE	19

#define CT_W				16
#define CT_H				6
#define CT_POS_X			GUI_GRID_CENTER_X + ((GW / 2) - (CT_W / 2))
#define CT_POS_Y			GUI_GRID_CENTER_Y + (GH - (CT_H / 2))

#define CT_ROW_H			1
#define CT_HEADER_H			1

#define VSCROLL_W			0.018
#define HSCROLL_H			0.018

#define ROW_CTRL_OFFSET		CALC_CTRL_OFFSET(CT_ROW_H)
#define ROW_CTRL_H			CALC_CTRL_H(ROW_CTRL_OFFSET)

#define HDR_CTRL_OFFSET		CALC_CTRL_OFFSET(CT_HEADER_H)
#define HDR_CTRL_H			CALC_CTRL_H(HDR_CTRL_OFFSET)

#define BACK_X					0
#define BACK_W					CT_W

#define ROW_COL0_X				BACK_X
#define ROW_COL0_W				(BACK_W / 2)

#define ROW_COL1_X				(ROW_COL0_X + ROW_COL0_W)
#define ROW_COL1_W				(BACK_W / 2)

#define HDR_COL0_X				ROW_COL0_X
#define HDR_COL0_W				ROW_COL0_W

#define HDR_COL1_X				((HDR_COL0_X + HDR_COL0_W) + 2)
#define HDR_COL1_W				(HDR_COL0_W / 2)

class ROTR_ActiveZeusList {
	idc = -1;

	x = CT_POS_X	* GUI_GRID_W;
	y = CT_POS_Y	* GUI_GRID_H;
	w = CT_W		* GUI_GRID_W;
	h = CT_H		* GUI_GRID_H;

	type			= CT_CONTROLS_TABLE;
	style			= ST_BACKGROUND;

	lineSpacing		= 0;
	rowHeight		= CT_ROW_H		* GUI_GRID_H;
	headerHeight	= CT_HEADER_H	* GUI_GRID_H;
	 
	firstIDC		= 70500;
	lastIDC			= 70599;
	 
	selectedRowColorFrom[]	= {0.7, 0.85, 1, 0.25};
	selectedRowColorTo[]	= {0.7, 0.85, 1, 0.5};

	selectedRowAnimLength	= 1.2;
	 
	class VScrollBar : ScrollBar {
		width				= VSCROLL_W;
		autoScrollEnabled	= 0;
	};
 
	class HScrollBar : ScrollBar {
		height				= HSCROLL_H;
	};

	class RowTemplate {
		class RowBackground	{
			controlBaseClassPath[] = {"RscText"};

			columnX			= BACK_X			* GUI_GRID_W;
			columnW			= BACK_W			* GUI_GRID_W;

			controlOffsetY	= 0;
			controlH		= CT_ROW_H			* GUI_GRID_H;
		};

		class Name {
			controlBaseClassPath[] = {"RscText"};

			columnX			= ROW_COL0_X		* GUI_GRID_W;
			columnW			= ROW_COL0_W		* GUI_GRID_W;

			controlOffsetY	= ROW_CTRL_OFFSET	* GUI_GRID_H;
			controlH		= ROW_CTRL_H		* GUI_GRID_H;
		};

		class UID {
			controlBaseClassPath[] = {"RscText"};

			columnX			= ROW_COL1_X		* GUI_GRID_W;
			columnW			= ROW_COL1_W		* GUI_GRID_W;

			controlOffsetY	= ROW_CTRL_OFFSET	* GUI_GRID_H;
			controlH		= ROW_CTRL_H		* GUI_GRID_H;
		};
	};

	class HeaderTemplate {
		class HeaderBackground {
			controlBaseClassPath[] = {"RscText"};

			columnX			= BACK_X			* GUI_GRID_W;
			columnW			= BACK_W			* GUI_GRID_W;

			controlOffsetY	= 0;
			controlH		= CT_HEADER_H		* GUI_GRID_H;
		};

		class Description {
			controlBaseClassPath[] = {"RscText"};

			columnX			= HDR_COL0_X		* GUI_GRID_W;
			columnW			= HDR_COL0_W		* GUI_GRID_W;

			controlOffsetY	= HDR_CTRL_OFFSET	* GUI_GRID_H;
			controlH		= HDR_CTRL_H		* GUI_GRID_H;
		};

		class KickButton {
			controlBaseClassPath[] = {"RscButton"};

			columnX			= HDR_COL1_X		* GUI_GRID_W;
			columnW			= HDR_COL1_W		* GUI_GRID_W;

			controlOffsetY	= HDR_CTRL_OFFSET	* GUI_GRID_H;
			controlH		= HDR_CTRL_H		* GUI_GRID_H;
		};
	};
};