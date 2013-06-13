
///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package widgets.Samples.WaterChart
{

import com.esri.ags.portal.supportClasses.PopUpMediaInfo;
import com.esri.ags.skins.supportClasses.PopUpMediaBrowser;

//import mx.controls.AdvancedDataGrid;

public class WaterChartBrowser extends PopUpMediaBrowser
{
    public var labelField:String;

    public var sum:Number;
    public var min:Number;
    public var max:Number;
    public var count:Number;
    public var average:Number;

    [Bindable]
    public var precision:int = -1;

    override public function getChartData():Array
    {
        var result:Array;
		var staticsResult:Array;
        var attributes:Array = this.attributes as Array;
        var mediaInfo:PopUpMediaInfo = this.activeMediaInfo;
        resetStats();

        if (attributes && mediaInfo.chartFields)
        {
            result = [];
			staticsResult = [] ;
			
            var normalizer:Number = attributes[mediaInfo.chartNormalizationField];
            var chartField:String = mediaInfo.chartFields[0]; //only one field per chart data
			var chartField1:String = mediaInfo.chartFields[1];

		//  var value:Number = 0 ;
			var staticsValue:Number = 1;
			var Found:Boolean = false;
			var chartData:Object;
            for each (var attributeKeyValuePair:Object in attributes)
            {
               // var name:Object = attributeKeyValuePair[chartField];
				var fieldValue:Object = attributeKeyValuePair[chartField];
				
				fieldValue = chartField+fieldValue ;
				
				if ( result.length > 0)
				{
					
					for each ( var O:Object in result ){
						
						
						
//						var temp:Object = result[i];
//						var tempName:String = temp.@name;
//						var tempValue:String = temp.@value;
						
						if ( O.name == fieldValue){
							O.value++;
							
							Found = true;
							break;
						}
					}
					
					if (Found == false){     // new fieldValue

								chartData = { name: fieldValue, value: staticsValue };
								result.push(chartData);		
								
								
							
						}else{
							Found = false;
						 
					}
					
				}
				else
				{
					
				//	var chartData:Object = { name: name, value: staticsValue };
				   chartData = { name: fieldValue, value: staticsValue };
					result.push(chartData);					
				}

				
				//value += attributeKeyValuePair[chartField];
//                if (isFinite(value) && isFinite(normalizer) && normalizer != 0)
//                {
//                    value /= normalizer;
//                }

          //      var label:String = labelField ? attributeKeyValuePair[labelField] : "";
               
			//	var chartData:Object = { name: label, value: value };
				
			//	var chartData:Object = { name: value, value: staticsValue };

              //  updateStats(value);
              //  result.push(chartData);
            }
        }
		//mx.controls.Alert.show(" getChartData ="+ result );
        return result;
    }

    private function resetStats():void
    {
        sum = 0;
        min = Number.POSITIVE_INFINITY;
        max = Number.NEGATIVE_INFINITY;
        count = 0;
        average = 0;
    }

    private function updateStats(value:Number):void
    {
        sum += value;
        if (value < min)
        {
            min = value;
        }
        if (value > max)
        {
            max = value;
        }
        count++;
        average = sum / count;
    }
}
}
