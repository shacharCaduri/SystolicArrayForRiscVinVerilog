int main() {
	//worked with delayes means the answer from the tpu that was shown were 05555444444444444 by this order each clock
	int *rowA0 = (int*)0xC, *rowA1 = (int*)0x10, *rowA2 = (int*)0x14 , *rowA3 = (int*)0x18;
	*rowA0 = 16908292; // 1204
	*rowA1 = 84281096; // 5678
	*rowA2 = 16777988; // 1034
	*rowA3 = 84279304; // 5608
	int *colB0 = (int*)0x1C, *colB1 = (int*)0x20, *colB2 = (int*)0x24 , *colB3 = (int*)0x28;
	*colB0 = 16777477; // 1015
	*colB1 = 393728; // 0620
	*colB2 = 50790407; // 3707
	*colB3 = 67634184; // 4848	
	
	int *leds0 = (int*)0x2C, *leds1 = (int*)0x30, *leds2 = (int*)0x34 , *leds3 = (int*)0x38; 
	
	*leds0 = (*rowA0) * (*colB0);


}